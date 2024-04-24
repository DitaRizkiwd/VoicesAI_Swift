//
//  StoriesView.swift
//  VoicesAI
//
//  Created by MACBOOK PRO on 24/04/24.
//

import SwiftUI

struct StoriesView: View {
    @State private var selectedTopics : Topics = .persahabatan
    @State private var selectedMood : Mood = .bahagia
    
    @State private var storyToday : String = ""
    var body: some View {
        NavigationStack{
            Form{
                //Mark: - CHOOSE PICKER

                Section{
                    Picker(selection: $selectedTopics){
                        ForEach(Topics.allCases, id:\.self){
                            topic in Text(topic.rawValue.capitalized)
                                .font(.subheadline)
                                .tag(topic)
                                
                                
                        }
                    }
                    
                    label:{
                        Text("Choose Topics")
                            .foregroundStyle(.secondary)
                    }
                    .tint(.primary)
                    
                    Picker(selection: $selectedMood){
                        ForEach(Mood.allCases, id:\.self){
                            mood in Text(mood.rawValue.capitalized)
                                .font(.subheadline)
                                .tag(mood)
                        }
                        
                    }
                    
                    label:{
                        Text("Choose Moods")
                            .foregroundStyle(.secondary)
                    }
                    .tint(.primary)
                    
                    
                    
                    
                    
//                    Picker("Choose topics", selection: $selectedTopics){
//                        ForEach(Topics.allCases, id:\.self){
//                            topic in Text(topic.rawValue.capitalized)
//                                .font(.subheadline)
//                        }
//                    }
                    
                    
                    
//                    Picker("Choose Mood", selection: $selectedMood){
//                        ForEach(Mood.allCases, id:\.self){
//                            mood in Text(mood.rawValue.capitalized)
//                                .font(.subheadline)
//                        }
//                    }
                }
            header:{
                Text("Topics")
            }
            footer:{
                Text("Choose any topics and mood that you want listen")
            }
                
                //Mark: - TEXT EDITOR

        
            Section{
                    TextEditor(text: $storyToday)
                    .frame(height: 200)
                    .font(.system(.headline,design: .rounded))
                    .foregroundStyle(.blue)
            }
            header:{
                Text("Todays Story")
            }
            footer:{
                Text("This stories are being generated by GeminiAI")
            }
                
                
                //Mark: - BUTTON GENERATE
                Button{
                    
                }
            label:{
                Text("Generate".uppercased())
                    .font(.system(.callout, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .buttonStyle(PlainButtonStyle())
            .frame(maxWidth: .infinity)

                
                
                
                
            }
            .navigationTitle("Stories")
            
        }
    }
}

#Preview {
    StoriesView()
}