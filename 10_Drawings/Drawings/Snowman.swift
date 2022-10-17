//
//  Snowman.swift
//  Drawings
//
//  Created by Sonja Ek on 17.10.2022.
//

import SwiftUI

struct Head: View {
    var body: some View {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 120, height: 120)
                
                VStack {
                    Eyes()
                    Nose()
                        .fill(.orange)
                        .frame(width: 30, height: 30)
                }

                Mouth(startAngle: .degrees(135), endAngle: .degrees(225), clockwise: true)
                    .stroke(.black, lineWidth: 3)
                    .frame(width: 50, height: 50)
                    .offset(y: 15)
            }
    }
}

struct Eyes: View {
    var body: some View {
        HStack(spacing: 30) {
            Circle()
                .frame(width: 15, height: 15)
            
            Circle()
                .frame(width: 15, height: 15)
        }
    }
}

struct Nose: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + 15, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX + 45, y: rect.maxY - 15))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Mouth: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        return path
    }
}

struct Core: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.white)
                .frame(width: 200, height: 200)

            HStack(spacing: 160) {
                Arm(rotation: 20)
                Arm(rotation: -20)
            }
        }
    }
}

struct Arm: View {
    let rotation: Double
    
    var body: some View {
        Rectangle()
            .fill(.black)
            .frame(width: 100, height: 3)
            .offset(x: 0, y: -40)
            .rotationEffect(Angle(degrees: rotation))
    }
}

struct Bottom: View {
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: 280, height: 280)
    }
}

struct Snowman: View {
    let name = "Snowman"

    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack(spacing: -15) {
                Head()
                Core()
                Bottom()
            }
        }
    }
}

struct Snowman_Previews: PreviewProvider {
    static var previews: some View {
        Snowman()
    }
}
