//
//  Backgrounds.swift
//  ViewsAndModifiers
//
//  Created by Sonja Ek on 23.10.2022.
//

import SwiftUI

struct Backgrounds: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
            // Color all the remaining background space: declare frame first
            // Important: use maxWidth and maxHeight instead of width and height
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cyan)
    }
}

struct Backgrounds_Previews: PreviewProvider {
    static var previews: some View {
        Backgrounds()
    }
}
