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
        let model = GenerativeModel(name: "gemini-pro", apiKey: apiKey)
        let topicString = topic.rawValue
        let moodString = mood.rawValue
        
        let prompt = "Tuliskan kutipan tentang \(topicString) dengan emosi \(moodString). maksimal terdiri dari 40 kata. Dan tidak ada kaitannya dengan seksualitas"
        
        do{
            let response = try await model.generateContent(prompt)
            if let text = response.text{
                storyText = text
            }
        }
        catch{
            errorMessage = "Failed to generated story \(error.localizedDescription)"
        }
    }

}
