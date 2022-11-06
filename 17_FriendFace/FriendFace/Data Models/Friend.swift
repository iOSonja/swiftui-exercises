//
//  Friend.swift
//  FriendFace
//
//  Created by Sonja Ek on 6.11.2022.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}
