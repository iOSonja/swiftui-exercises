//
//  ContentView.swift
//  Drawings
//
//  Created by Sonja Ek on 17.10.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Snowman()
                } label: {
                    VStack {
                        Text("Snowman")
                    }
                    .padding()
                }
                NavigationLink {
                    Flower()
                } label: {
                    VStack {
                        Text("Flower")
                    }
                    .padding()
                }
                NavigationLink {
                    ImageFrame()
                } label: {
                    VStack {
                        Text("Image Frame")
                    }
                    .padding()
                }
                
                NavigationLink {
                    ColorCyclingCircle()
                } label: {
                    VStack {
                        Text("Color Cycling Circle")
                    }
                    .padding()
                }
            }
            .navigationTitle("Drawings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
