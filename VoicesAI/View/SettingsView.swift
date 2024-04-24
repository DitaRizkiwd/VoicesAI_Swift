//
//  SettingsView.swift
//  VoicesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var apiKey : String = ""
    @State private var elevenLansKey: String = ""
    
    let signUpGemini = "https://ai.google.dev"
    let signUpElevenLabs = "https://elevenlabs.io/api"
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("API KEY", text: $apiKey)
                    TextField("ELEVEN KEY", text: $elevenLansKey)
                    
                }
            header:{
                Text("API KEYS")
            }
            footer:{
                Text("Please input your API Key above")
            }
                
            Section{
                Link("Get API Key Gemini AI", destination: URL(string: signUpGemini)!)
                Link("Get API Key Gemini AI", destination: URL(string: signUpElevenLabs)!)
                
                }
            
            header:{
                Text("Dont have api key")
            }
            footer:{
                Text("Sign up to get your own api key via link above")
            }
                
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button{
                    
                }
            label:{
                Text("Save")
            }
            }
        }
    }
}

#Preview {
    SettingsView()
}
