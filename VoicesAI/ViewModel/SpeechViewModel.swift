//
//  SpeechViewModel.swift
//  VoicesAI
//
//  Created by MACBOOK PRO on 25/04/24.
//

import Foundation
import AVFoundation

@MainActor
class SpeechViewModel: NSObject, ObservableObject, AVAudioPlayerDelegate{
    @Published var isLoading = false
    @Published var isPlaying = false
    @Published var errorMessage: String?
    
    private var elevenLabsService: ElevenLabsService?
    private var audioPlayer: AVAudioPlayer?
    
    //Mark: - GENERATE AND PLAY SPEECH
    func generateAndPlaySpeech(from text: String, apiKey:String) async {
        isLoading = true
        defer{isLoading = false}
        isPlaying = true
        defer{isPlaying = false}
        errorMessage = nil
        
        elevenLabsService = ElevenLabsService(apiKey: apiKey)
        
        do{
            guard let audioData = try await elevenLabsService?.generateSpeech(for: text) else{
                errorMessage = "Failed to generate audio data."
                print(errorMessage!)
                return
            }
            playAudio(from: audioData)
        }
        catch{
            print("Error generating or playing speech \(error)")
        }
    }

}

//Mark: - FUNCTION PLAY AUDIO
extension SpeechViewModel{
    func playAudio(from data: Data){
        do{
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer?.delegate = self
            isPlaying = true
            audioPlayer?.play()
        
        }
        catch {
            print("Audio Player error \(error)")
            
        }
    }
}

