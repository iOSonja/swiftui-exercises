//
//  ContentView.swift
//  HabitTracker
//
//  Created by Sonja Ek on 22.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var habits = Habits()
    @State private var showingAddHabit = false

    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    NavigationLink {
                        HabitView(habits: habits, habitItem: item)
                    } label: {
                        Text(item.name)
                    }
                    .padding()
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habit Tracker")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem() {
                    Button("Add Habit") {
                        showingAddHabit = true
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabitView(habits: habits)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
