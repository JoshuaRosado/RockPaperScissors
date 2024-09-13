//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Joshua Rosado Olivencia on 9/13/24.
//

import SwiftUI


struct gametitlefont: View{
    var text: String
    
    var body: some View{
        Text(text)
            .font(.largeTitle).fontWidth(.compressed).fontWeight(.heavy).foregroundStyle(.secondary)
        
    }
}

struct ContentView: View {
    
    let listOfOptions = ["Rock", "Paper", "Scissors"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var optionSelected = "Rock"
    @State private var score = 0
    @State private var userName = ""
    @State private var rounds = 10
    
    
    
    var body: some View {
        ZStack{
            // ==========  bg section
            Section{
                RadialGradient(colors: [.teal.opacity(0.2), .yellow.opacity(0.20)], center: .bottom, startRadius: 200 , endRadius: 800)
                    .ignoresSafeArea()
            }
            // ========== content stack
            VStack{
                // ========== headline
                VStack{
                    gametitlefont(text: "RockPaperScissors")
                }
                .padding(.top, 25)
                Spacer()


                    
                    VStack{
                        ForEach(0..<3){number in
                            Button{
                            } label: {
                                Text("\(listOfOptions[number])")
                            }
                        }
                        .buttonStyle(.bordered).padding(5).font(.largeTitle).foregroundColor(.white).bold()
                    }
            
                Spacer()
                Text("Score: \(score)")
                
            }

        }
    }
}
#Preview {
    ContentView()
}
