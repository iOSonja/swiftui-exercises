//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Sonja Ek on 1.11.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    var body: some View {
        Button("Save") {
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
