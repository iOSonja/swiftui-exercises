//
//  User.swift
//  FriendFace
//
//  Created by Sonja Ek on 6.11.2022.
//

import Foundation

struct User: Codable, Identifiable {
    var id: UUID
    var isActive: Bool
    var name: String
    var company: String
    var about: String
    var registered: Date
    var friends: [Friend]
    
    static let example = User(id: UUID(), isActive: true, name: "Sonja Ek", company: "Oak Tree Productions", about: "I'm a SwiftUI developer and the founder of Oat Tree Productions, which is the most legitimate-sounding company name I've come up with so far. Contact me for linguist jokes.", registered: Date.now, friends: [Friend(id: UUID(), name: "John Appleseed"), Friend(id: UUID(), name: "Mary Babyface"), Friend(id: UUID(), name: "Mark Manson")])
}
