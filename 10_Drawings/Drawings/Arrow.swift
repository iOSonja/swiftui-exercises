//
//  Arrow.swift
//  Drawings
//
//  Created by Sonja Ek on 22.10.2022.
//

import SwiftUI

struct Pointer: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))

        return path
    }
}

struct Arrow: View {

    var body: some View {
        VStack(spacing: -47) {
            Pointer()
                .stroke(.black, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .frame(width: 50, height: 50)

            Rectangle()
                .frame(width: 2, height: 300)
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
