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
            person.image?
                .resizable()
                .scaledToFit()
                .padding()
                .navigationTitle(person.name)
        }
    }
}

