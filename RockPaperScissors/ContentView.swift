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
            .padding(.top, 30)
            .font(.system(size: 30.0, weight: .regular, design: .rounded))
            .fontWidth(.compressed).fontWeight(.heavy).foregroundStyle(.secondary).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        
    }
}

struct ContentView: View {
    
    let listOfOptions = ["Rock", "Paper", "Scissors"]
    
    
    
    @State private var randomAnswer = Int.random(in: 0...2)
    
    @State private var optionSelected = ""
    @State private var score = 0
    @State private var rounds = 1
    @State private var selectionResult = ""
    @State private var showScore = false
    @State private var gameOver = false
    
    
    @State private var userWon = false
    @State private var userLoss = false
    @State private var draw = false

     

    

    
    var body: some View {
        ZStack{
            // ==========  bg section
            Section{
                RadialGradient(colors: [.secondary.opacity(0.2), .green.opacity(0.9)], center: .center, startRadius: 200 , endRadius: 800)
                    .ignoresSafeArea()
            }
            // ========== content stack
            VStack{
                // ========== headline
                VStack{
                    gametitlefont(text: "RockPaperScissors")
                }
                .padding(.top, 25)
                .padding(.bottom, 20)
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
                        .padding(20).font(.system(size: 35, weight: .black, design:  .rounded)).shadow(radius: 2).buttonStyle(.bordered)
                        .foregroundStyle(.white)
                        .tint(.green.opacity(0.8))
                        
                    }
                    
                Spacer()
                Spacer()
                
                // ========== score display
                Text("Score: \(score)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                    .foregroundStyle(userWon ? .blue.opacity(0.8): .secondary)
                
            }
            .alert("\(listOfOptions[randomAnswer])", isPresented: $showScore){
                Button("Next", action: gameLimit)
            } message:{
                Text("\(selectionResult)")
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
            var optionSelected = listOfOptions[number]
            let winningResult = "You win! \(optionSelected) beats \(listOfOptions[randomAnswer])"
            let loosingResult = "You loose! \(listOfOptions[randomAnswer]) beats \(optionSelected)"
            let drawResult = "\(listOfOptions[randomAnswer]) vs \(optionSelected) Is a draw "
            optionSelected = listOfOptions[number]
            
            
            
            switch(listOfOptions[number], randomAnswer){
                
            case ("Rock", 2):
                selectionResult = winningResult
                score += 1
                showScore = true
                userWon = true
                
            case ("Rock", 0):
                selectionResult = drawResult
                showScore = true
                draw = true
                
            case ("Rock", 1):
                selectionResult = loosingResult
                showScore = true
                userLoss = true
                
            case ("Paper", 0):
                selectionResult = winningResult
                score += 1
                showScore = true
                userWon = true
                
                
            case ("Paper", 2):
                selectionResult = loosingResult
                showScore = true
                userLoss = true
                
            case ("Paper", 1):
                selectionResult = drawResult
                showScore = true
                draw = true
                
            case ("Scissors", 1):
                selectionResult = winningResult
                score += 1
                showScore = true
                userWon = true
                
            case ("Scissors", 0):
                selectionResult = loosingResult
                showScore = true
                userLoss = true
                
            case ("Scissors", 2):
                selectionResult = drawResult
                showScore = true
                draw = true
                
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
            userWon = false
            userLoss = false
            draw = false
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
