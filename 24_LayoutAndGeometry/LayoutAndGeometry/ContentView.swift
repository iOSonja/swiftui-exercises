//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Sonja Ek on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CustomLayoutView()
                .tabItem {
                    Label("Custom Layout", systemImage: "align.vertical.center")
                }
            
            AbsolutePositioningView()
                .tabItem {
                    Label("Absolute Positioning", systemImage: "align.vertical.top")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
