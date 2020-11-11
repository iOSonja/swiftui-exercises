//
//  ContentView.swift
//  4-RockPaperScissors
//
//  Created by Sonja Ek on 11.11.2020.
//

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
    // @State private var
    @State private var score = 0
    

    func moveMade(_ move: String) {
        score += 1
    }
    
    
    var body: some View {
        VStack {
            Text("\(score)")
            Text("\(moves[appsChoice])")
            Text("\(winningPreference(shouldWin))")
            
            Button(action: {
                self.moveMade("Rock")
            }) {
                Text("Rock")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
