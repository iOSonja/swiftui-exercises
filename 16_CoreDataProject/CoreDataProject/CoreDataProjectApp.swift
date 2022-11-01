//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Sonja Ek on 1.11.2022.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
