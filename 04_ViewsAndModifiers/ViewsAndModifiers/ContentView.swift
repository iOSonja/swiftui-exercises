//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sonja Ek on 23.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink {
                        Backgrounds()
                    } label: {
                        Text("Backgrounds")
                    }
                    .padding()
                    
                    NavigationLink {
                        ViewComposition()
                    } label: {
                        Text("View Composition")
                    }
                    .padding()
                    
                    NavigationLink {
                        TitleCustomModifier()
                    } label: {
                        Text("Title Custom Modifier")
                    }
                    .padding()

                    NavigationLink {
                        WatermarkCustomModifier()
                    } label: {
                        Text("Watermark Custom Modifier")
                    }
                    .padding()
                }
                .navigationTitle("Views and Modifiers")

                Text("Note:\n\nCustom view modifiers can have their own stored properties, extensions to View cannot.\n\nChoose your tool based on this.")
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
