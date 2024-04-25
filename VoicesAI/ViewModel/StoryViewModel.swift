//
//  StoryViewModel.swift
//  VoicesAI
//
//  Created by MACBOOK PRO on 25/04/24.
//

import Foundation
import GoogleGenerativeAI

@MainActor
class StoryViewModel: ObservableObject {
    @Published var storyText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var displayedStoryText = "" //display typewriting effect
    
    private var timer: Timer?
    
    //Mark: - GENERATE STORY
    func generateStory(topic: Topics, mood: Mood) async {
        isLoading = true
        defer{isLoading = false}
        errorMessage = nil
        storyText = ""
        let apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
        guard !apiKey.isEmpty else{
            errorMessage = "API KEY is missing. please set it in settings page"
            return
        }
        
        //Mark: - TYPEWRITER EFFECT
        

        
        
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        let topicString = topic.rawValue
        let moodString = mood.rawValue
        
        let prompt = "Tuliskan kutipan tentang \(topicString) dengan emosi \(moodString). maksimal terdiri dari 40 kata. Dan tidak ada kaitannya dengan seksualitas"
        
        do{
            let response = try await model.generateContent(prompt)
            if let text = response.text{
                storyText = text
                startTypeWriterEffect()
            }
        }
        catch{
            errorMessage = "Failed to generated story \(error.localizedDescription)"
        }
    }
    func startTypeWriterEffect(){
        displayedStoryText = ""
        var charIndex = 0
        
        DispatchQueue.main.async{
            self.displayedStoryText = ""
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            guard charIndex < self.storyText.count else {
                timer.invalidate()
                return
            }
            DispatchQueue.main.async{
                let index = self.storyText.index(self.storyText.startIndex, offsetBy: charIndex)
                self.displayedStoryText += String(self.storyText[index])
                charIndex += 1
            }
        }
    }

}
