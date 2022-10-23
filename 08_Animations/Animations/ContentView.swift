//
//  ContentView.swift
//  Animations
//
//  Created by Sonja Ek on 23.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ImplicitAnimation()
                } label: {
                    Text("Implicit Animation")
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
