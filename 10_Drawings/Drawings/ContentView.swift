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
                    Text("Snowman")
                }
                NavigationLink {
                    Flower()
                } label: {
                    Text("Flower")
                }
                NavigationLink {
                    ImageFrame()
                } label: {
                    Text("Image Frame")
                }
                NavigationLink {
                    ColorCyclingCircle()
                } label: {
                    Text("Color Cycling Circle")
                }
                NavigationLink {
                    Blur()
                } label: {
                    Text("Blur")
                }
                NavigationLink {
                    ColorFilter()
                } label: {
                    Text("Color Filter")
                }
                NavigationLink {
                    OverlappingCircles()
                } label: {
                    Text("Overlapping Circles")
                }
                NavigationLink {
                    AnimatedTrapezoid()
                } label: {
                    Text("Animated Trapezoid")
                }
                NavigationLink {
                    AnimatedCheckerboard()
                } label: {
                    Text("Animated Checkerboard")
                }
                NavigationLink {
                    Arrow()
                } label: {
                    Text("Arrow")
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
