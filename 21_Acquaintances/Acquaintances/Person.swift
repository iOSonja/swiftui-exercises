//
//  Person.swift
//  Acquaintances
//
//  Created by Sonja Ek on 21.11.2022.
//

import Foundation
import SwiftUI

struct Person: Codable, Comparable, Identifiable {
    let id: UUID
    let name: String
    
    static func <(lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
    
    var image : Image? {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(id.uuidString + ".jpg").path
        if let uiImage = UIImage(contentsOfFile: path) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
}
