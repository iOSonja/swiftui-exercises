//
//  ContentView.swift
//  TimesTable
//
//  Created by Sonja Ek on 3.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var upToNumber = 2
    @State private var nbrOfQuestions = 5
    @State private var currentMultiplier = 0
    @State private var currentMultipliable = 0
    @State private var answer: Int? = nil
    @State private var questionsAsked = 0
    @State private var displayAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var questionsAreVisible = false

    @FocusState private var inputFieldIsFocused: Bool
    
    let questionNubrOptions = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Section {
                    Picker("Ask questions up to times...", selection: $upToNumber) {
                        ForEach(2..<13, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Up to which number do you want to multiply?")
                }

                Section {
                    Picker("How many questions?", selection: $nbrOfQuestions) {
                        ForEach(questionNubrOptions, id: \.self) {
                            Text($0, format: .number)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How many questions will I ask?")
                }

                Button("I'm ready!", action: {
                    newQuestion()
                    questionsAreVisible = true
                })

                Spacer()

                if questionsAreVisible {
                    Section {
                        TextField("Product", value: $answer, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($inputFieldIsFocused)
                            .onSubmit(checkAnswer)
                    } header: {
                        Text("How much is \(currentMultiplier) x \(currentMultipliable) ?")
                    }
                }

                Spacer()
                Spacer()
            }
            .alert(alertTitle, isPresented: $displayAlert) {
                Button("OK", role: .cancel) {
                    if questionsAsked < nbrOfQuestions{
                        newQuestion()
                    } else {
                        questionsAreVisible = false
                    }
                }
            } message: {
                Text(alertMessage)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    inputFieldIsFocused = false
                }
            }
        }
    }

    func newQuestion() {
        answer = nil
        currentMultiplier = Int.random(in: 2 ..< upToNumber + 1)
        currentMultipliable = Int.random(in: 2 ..< 13)
        questionsAsked += 1
    }

    func checkAnswer() {
        guard let answer = answer else { return }

        let correctAnswer = currentMultiplier * currentMultipliable
        if answer == correctAnswer {
            alertTitle = "Correct!"
        } else {
            alertTitle = "False"
            alertMessage = "\(currentMultiplier) x \(currentMultipliable) = \(correctAnswer)"
        }

        displayAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
