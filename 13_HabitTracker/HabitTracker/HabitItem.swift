//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Sonja Ek on 22.10.2022.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var timesCompleted: Int
}
