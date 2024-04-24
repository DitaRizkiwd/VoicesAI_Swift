//
//  Constant.swift
//  VoicesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import Foundation
struct Constant{
    static let baseURL = "https://api.elevenlabs.io/"
    static let appVersion = "v1"
    
    enum endpoint: String {
        case textToSpeech = "text-to-speech"
    }
    enum voiceID: String {
        case myra = "7fbQ7yJuEo56rYjrYaEh"
    }
    
    static func fullURL(forVoice voice: voiceID) -> String{
        return baseURL + appVersion + "/" + endpoint.textToSpeech.rawValue + "/" + voice.rawValue
    }
}
