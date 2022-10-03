//
//  ContentView.swift
//  07_TimesTable
//
//  Created by Sonja Ek on 3.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var upToNumber = 2
    @State private var nbrOfQuestions = 5
    
    let questionNubrOptions = [5, 10, 20]
    
    var body: some View {
        VStack {
            Spacer()
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

            Spacer()

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

            Spacer()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
