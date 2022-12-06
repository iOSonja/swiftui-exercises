//
//  DetailView.swift
//  Acquaintances
//
//  Created by Sonja Ek on 25.11.2022.
//

import SwiftUI

struct DetailView: View {
    let person: Person

    var body: some View {
        NavigationView {
            VStack {
                person.image?
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .navigationTitle(person.name)

                if person.latitude != nil && person.longitude != nil {
                    NavigationLink {
                        MapView(latitude: person.latitude!, longitude: person.longitude!)
                            .edgesIgnoringSafeArea(.all)
                    } label: {
                        Text("See the meeting location on a map")
                    }
                }
                else {
                    Spacer()
                    Text("No location data available")
                    Spacer()
                }
            }
            .navigationTitle(person.name)
        }
    }
}

