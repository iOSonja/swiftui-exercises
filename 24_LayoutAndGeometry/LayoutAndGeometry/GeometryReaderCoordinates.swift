//
//  GeometryReaderCoordinates.swift
//  LayoutAndGeometry
//
//  Created by Sonja Ek on 14.12.2022.
//

import SwiftUI

// Which coordinate space you want to use depends on what question you want to answer:
// Want to know where this view is on the screen? Use the global space.
// Want to know where this view is relative to its parent? Use the local space.
// What to know where this view is relative to some other view? Use a custom space.

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct GeometryReaderCoordinates: View {
    var body: some View {
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

struct GeometryReaderCoordinates_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderCoordinates()
    }
}
