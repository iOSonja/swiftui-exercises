//
//  ContentView.swift
//  AccessibilityProject
//
//  Created by Sonja Ek on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    LabeledImagesView()
                } label: {
                    Text("Labeled Images View")
                }

                NavigationLink {
                    GroupedElementsView()
                } label: {
                    Text("Grouped Elements View")
                }

                NavigationLink {
                    CustomSwipeView()
                } label: {
                    Text("Custom Swipe Action View")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
