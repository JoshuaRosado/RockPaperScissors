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
    
    
    
    @State private var randomAnswer = Int.random(in: 0...2)
    
    @State private var optionSelected = "Rock"
    @State private var score = 0
    @State private var userName = ""
    @State private var rounds = 1
    @State private var selectionResult = ""
    @State private var showScore = false
    @State private var gameOver = false
    @State private var userWon = false
     

    

    
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


                    // ========== btns options
                    VStack{
                        ForEach(0..<3){number in
                            Button{
                                matchResult(number)
                            } label: {
                                Text("\(listOfOptions[number])")
                            }
                        }
                        .buttonStyle(.bordered).padding(5).font(.largeTitle).foregroundColor(.white).bold().shadow(radius: 1)
                    }
                    
            
                Spacer()
                
                // ========== score display
                Text("Score: \(score)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold().foregroundStyle(.secondary)
                
            }
            .alert("\(selectionResult)", isPresented: $showScore){
                Button("Next", action: gameLimit)
            } message:{
                Text("Score: \(score) / 10")
            }
            .alert("Game Over!", isPresented: $gameOver){
                Button("Try again", action: resetGame)
            } message:{
                Text("Final score: \(score) / 10")
            }
        }

        }
    func matchResult(_ number: Int){
            let winningResult = "You win!\(optionSelected) beats \(listOfOptions[randomAnswer])"
            let loosingResult = "You loose! \(listOfOptions[randomAnswer]) beats \(optionSelected)"
            let drawResult = "\(listOfOptions[randomAnswer]) vs \(optionSelected) Is a draw "
            
            
            
            switch(listOfOptions[number], randomAnswer){
                
            case ("Rock", 2):
                selectionResult = winningResult
                score += 1
                showScore = true
                userWon = true
                
            case ("Rock", 1):
                selectionResult = loosingResult
                showScore = true
                
            case ("Paper", 0):
                selectionResult = winningResult
                score += 1
                showScore = true
                userWon = true
                
                
            case ("Paper", 2):
                selectionResult = loosingResult
                showScore = true
                
            case ("Scissors", 1):
                selectionResult = winningResult
                score += 1
                showScore = true
                userWon = true
                
            case ("Scissors", 0):
                selectionResult = loosingResult
                showScore = true
            default:
                print("X")
                
            }
        }
        func nextRound(){
            randomAnswer = Int.random(in: 0...2)
            rounds += 1
        }
    func gameLimit(){
        if rounds < 10 {
            nextRound()
        }else if rounds == 10{
            gameOver = true
            
        }
    }
    func resetGame(){
        rounds = 0
        score = 0
    }
        
}
#Preview {
    ContentView()
}
