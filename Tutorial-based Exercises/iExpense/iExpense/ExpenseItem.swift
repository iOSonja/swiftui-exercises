//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sonja Ek on 8.3.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
