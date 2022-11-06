//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Sonja Ek on 6.11.2022.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
