//
//  FileManager-DocumentsDirectory.swift
//  Bucketlist
//
//  Created by Sonja Ek on 12.11.2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
