//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Sonja Ek on 22.10.2022.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let item = HabitItem(name: name, description: description, timesCompleted: 0)
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
