//
//  FileManager-Document.swift
//  Acquaintances
//
//  Created by Sonja Ek on 21.11.2022.
//

import SwiftUI

extension FileManager {
    var getDocumentsDirectory : URL {
        let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func fileNameInDocumentsDirectory(_ file: String) -> URL {
        return self.getDocumentsDirectory.appendingPathComponent(file)
    }
}
