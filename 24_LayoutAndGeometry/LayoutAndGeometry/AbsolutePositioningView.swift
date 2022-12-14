//
//  AbsolutePositioningView.swift
//  LayoutAndGeometry
//
//  Created by Sonja Ek on 14.12.2022.
//

import SwiftUI

struct AbsolutePositioningView: View {
    var body: some View {
        ZStack {
            Text("I am an absolutely \npositioned text with \na pink background. \nMy center is at \n100, 100 coordinate.")
                .position(x: 100, y: 100)
                .background(.pink.opacity(0.2))
            
            Text("I am a text with \nan offset and a \nred background.")
                .offset(x: 100, y: 100)
                .background(.red)

            Text("I am a text with a \nblue background \nan THEN an offset.")
                .background(.blue.opacity(0.3))
                .offset(x: -100, y: 100)
        }
    }
}

struct AbsolutePositioningView_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePositioningView()
    }
}
