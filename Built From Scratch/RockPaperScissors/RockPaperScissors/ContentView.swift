//
//  ContentView.swift
//  4-RockPaperScissors
//
//  Created by Sonja Ek on 11.11.2020.
//

//TODO:
//- Find a way to give exactly 10 challenges
//- Handle tie cases
//- Style the buttons differently
//- Create a banner that tells the number of points in the end

import SwiftUI


let moves = ["Rock", "Paper", "Scissors"]


func winningPreference(_ shouldWin: Bool) -> String {
    if shouldWin {
        return "Try and win me!"
    } else {
        return "Please let me win"
    }
}


struct ContentView: View {
    
    @State private var appsChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var counter = 0 // when this reaches 10, the game ends
    @State private var score = 0
    @State private var correctMove = false
    

    func moveMade(_ move: String) -> Bool {
        // This method needs to be refactored later
        
        if shouldWin {
            if moves[appsChoice] == "Rock" {
                if move == "Paper" {
                    return true
                }
            } else if moves[appsChoice] == "Paper" {
                if move == "Scissors" {
                    return true
                }
            } else if moves[appsChoice] == "Scissors" {
                if move == "Rock" {
                    return true
                }
            }
            return false
        }
        
        if !shouldWin {
            if moves[appsChoice] == "Rock" {
                if move == "Paper" {
                    return false
                }
            } else if moves[appsChoice] == "Paper" {
                if move == "Scissors" {
                    return false
                }
            } else if moves[appsChoice] == "Scissors" {
                if move == "Rock" {
                    return false
                }
            }
            return true
        }
        return false // this line is there just to make the method exhaustive
    }
    
    
    var body: some View {
            VStack {
                Text("\(score)")
                Text("\(moves[appsChoice])")
                Text("\(winningPreference(shouldWin))")
                
                Button(action: {
                    correctMove = self.moveMade("Rock") // Was the move correct? Boolean value
                    counter += 1 // Doesn't yet do anything
                }) {
                    Text("Rock")
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    correctMove = self.moveMade("Paper")
                    counter += 1
                }) {
                    Text("Paper")
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    correctMove = self.moveMade("Scissors")
                    counter += 1
                }) {
                    Text("Scissors")
                }
                .buttonStyle(PlainButtonStyle())
                
                if correctMove {
                    Text("You made the right move.")
                }
            }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
