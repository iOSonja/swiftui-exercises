//
//  ColorFilter.swift
//  Drawings
//
//  Created by Sonja Ek on 20.10.2022.
//

import SwiftUI

struct ColorFilter: View {
    @State private var color = "red"

    let colors = ["red", "blue", "yellow", "green", "pink"]
    let colorDict: [String: Color] = [
        "red": .red,
        "blue": .blue,
        "yellow": .yellow,
        "green": .green,
        "pink": .pink
    ]

    var body: some View {
        VStack {
            Image("Example")
                .colorMultiply(colorDict[color] ?? .red)
            
            Picker("Select filter color", selection: $color){
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .background(.white) // for some reason the unselected options are otherwise invisible
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ColorFilter_Previews: PreviewProvider {
    static var previews: some View {
        ColorFilter()
    }
}
