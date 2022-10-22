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
                        .padding()
                }
                NavigationLink {
                    Flower()
                } label: {
                    Text("Flower")
                        .padding()
                }
                NavigationLink {
                    ImageFrame()
                } label: {
                    Text("Image Frame")
                        .padding()
                }
                NavigationLink {
                    ColorCyclingCircle()
                } label: {
                    Text("Color Cycling Circle")
                        .padding()
                }
                NavigationLink {
                    Blur()
                } label: {
                    Text("Blur")
                        .padding()
                }
                NavigationLink {
                    ColorFilter()
                } label: {
                    Text("Color Filter")
                        .padding()
                }
                NavigationLink {
                    OverlappingCircles()
                } label: {
                    Text("Overlapping Circles")
                        .padding()
                }
                NavigationLink {
                    AnimatedTrapezoid()
                } label: {
                    Text("Animated Trapezoid")
                        .padding()
                }
                NavigationLink {
                    AnimatedCheckerboard()
                } label: {
                    Text("Animated Checkerboard")
                        .padding()
                }
                NavigationLink {
                    Arrow()
                } label: {
                    Text("Arrow")
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
