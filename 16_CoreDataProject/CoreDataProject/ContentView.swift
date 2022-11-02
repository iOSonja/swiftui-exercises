//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Sonja Ek on 1.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ShipsView()
                } label: {
                    Text("Filtering @FetchRequest using NSPredicate")
                }
                .padding()

                NavigationLink {
                    DynamicFilteringView()
                } label: {
                    Text("Dynamically filtering @FetchRequest with SwiftUI")
                }
                .padding()
                
                NavigationLink {
                    CandyView()
                } label: {
                    Text("One-to-many relationships with Core Data, SwiftUI, and @FetchRequest")
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
