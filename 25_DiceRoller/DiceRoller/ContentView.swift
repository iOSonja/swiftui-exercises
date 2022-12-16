//
//  ContentView.swift
//  DiceRoller
//
//  Created by Sonja Ek on 16.12.2022.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct ContentView: View {
    @State private var currentRoll = 0
    @State private var rolls = [Result]()
    
    var result: String {
        currentRoll == 0 ? "-" : "\(currentRoll)"
    }

    var body: some View {
        VStack {
            VStack {
                Text("Current result:")
                Text(result)
            }

            .font(.title)
            .padding(100)
            Button("Throw again") {
                throwDice()
            }
            .modifier(ButtonStyle())
            .padding(.bottom, 100)

            Text("Past results:")
            ScrollView {
                ForEach(rolls.reversed()) {
                    Text("\($0.number)")
                }
                .frame(maxWidth: .infinity)
            }
        }
    }

    func throwDice() {
        if currentRoll > 0 {
            rolls.append(Result(number: currentRoll))
        }
        currentRoll = Int.random(in: 1...6)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
