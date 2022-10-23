//
//  WatermarkCustomModifier.swift
//  ViewsAndModifiers
//
//  Created by Sonja Ek on 23.10.2022.
//

import SwiftUI

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct WatermarkCustomModifier: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
}

struct WatermarkCustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        WatermarkCustomModifier()
    }
}
