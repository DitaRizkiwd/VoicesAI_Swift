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
                        .onAppear{
                            apiKey = UserDefaults.standard.string(forKey: "GeminiAIKey") ?? ""
                        }
                    TextField("ELEVEN KEY", text: $elevenLansKey)
                        .onAppear{
                            elevenLansKey = UserDefaults.standard.string(forKey: "ElevenLabsKey") ?? ""
                        }
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
            .navigationTitle("Configuration")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //Mark: - SAVE BUTTON

                Button{
                    saveKey()
                }
            label:{
                Text("Save")
                    
            }
            .padding(.trailing,8)
            .disabled(apiKey.isEmpty || elevenLansKey.isEmpty)
            }
        }
    }
}

#Preview {
    SettingsView()
}
extension SettingsView{
    func saveKey(){
        UserDefaults.standard.set(apiKey, forKey: "GeminiAIKey")
        UserDefaults.standard.set(elevenLansKey, forKey: "ElevenLabsKey")
    }
}
