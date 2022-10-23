//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by Sonja Ek on 23.10.2022.
//

import SwiftUI

struct CapsuleText: View {
    // Thanks to this custom view we don't need to copy-paste the shared modifiers
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ViewComposition: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "White text in a capsule")
                .foregroundColor(.white)
            CapsuleText(text: "Yellow text in a capsule")
                .foregroundColor(.yellow)
        }
    }
}

struct ViewComposition_Previews: PreviewProvider {
    static var previews: some View {
        ViewComposition()
    }
}
