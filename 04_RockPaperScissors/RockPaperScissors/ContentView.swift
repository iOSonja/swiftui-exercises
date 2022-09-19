//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sonja Ek on 19.9.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = ["rock", "paper", "scissors"]
    @State private var currentChoice = "rock"
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionNumber = 0
    @State private var gameOver = false
    
    var body: some View {
        VStack {
            Spacer()

            Text("Try to \(shouldWin ? "win" : "lose") this time!")
                .font(.title)

            Spacer()

            ForEach(moves, id: \.self) { move in
                Button(move.uppercased()) {
                    evaluateSuccess(move: move)
                }
                .padding()
                .font(.largeTitle)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }

            Spacer()

            Text("Score: \(score)")
                .font(.title)

            Spacer()
        }
        .alert("Game over", isPresented: $gameOver) {
            Button("Play again", action: reset)
        } message: {
                Text("Your final score is \(score)")
        }
    }

    func evaluateSuccess(move: String) {
        let solutions = [
            "rock": (win: "paper", lose: "scissors"),
            "paper": (win: "scissors", lose: "rock"),
            "scissors": (win: "rock", lose: "paper")
        ]

        guard let answer = solutions[currentChoice] else {
            fatalError("Unknown move: \(currentChoice)")
        }

        let isCorrect: Bool

        if shouldWin {
            isCorrect = move == answer.win
        } else {
            isCorrect = move == answer.lose
        }

        if isCorrect {
            score += 1
        } else {
            score -= 1
        }

        questionNumber += 1
        if questionNumber == 10 {
            gameOver = true
        }

        currentChoice = moves[Int.random(in: 0..<3)]
        shouldWin.toggle()
    }

    func reset() {
        questionNumber = 0
        score = 0
        currentChoice = moves[Int.random(in: 0..<3)]
        shouldWin.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
