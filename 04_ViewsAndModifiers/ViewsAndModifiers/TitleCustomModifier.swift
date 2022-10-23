//
//  TitleCustomModifier.swift
//  ViewsAndModifiers
//
//  Created by Sonja Ek on 23.10.2022.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    // This is optional
    // If you don't use this, replace the .titleStyle() modifier with .modifier(Title())
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct TitleCustomModifier: View {
    var body: some View {
        Text("Hello World")
            .titleStyle()
    }
}

struct TitleCustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        TitleCustomModifier()
    }
}
