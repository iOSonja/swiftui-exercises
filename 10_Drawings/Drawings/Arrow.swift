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
    @State private var thickness: CGFloat = 2

    var body: some View {
        ZStack {
            // "Empty" space for registering taps around the arrow:
            Rectangle()
                .fill(.white)
                .frame(width: 400, height: 400)
                .onTapGesture {
                    thickness = CGFloat.random(in: 1...20)
                }

            VStack(spacing: -47) {
                Pointer()
                    .stroke(.black, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 50)

                Rectangle()
                    .fill(.black)
                    .frame(width: thickness, height: 300)
            }
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
