//
//  HabitView.swift
//  HabitTracker
//
//  Created by Sonja Ek on 22.10.2022.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var habits: Habits
    let habitItem: HabitItem

    var body: some View {
        VStack {
            Text(habitItem.name)
                .font(.largeTitle)

            Text(habitItem.description)

            Text("Completed \(habitItem.timesCompleted) times")
        }
        .toolbar {
            Button("Log Habit") {
                var updatedHabitItem = habitItem
                updatedHabitItem.timesCompleted += 1
                let i = habits.items.firstIndex(of: habitItem)
                habits.items[i ?? habits.items.count] = updatedHabitItem
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habits: Habits(), habitItem: HabitItem(name: "skating", description: "This is a good one", timesCompleted: 5))
    }
}
