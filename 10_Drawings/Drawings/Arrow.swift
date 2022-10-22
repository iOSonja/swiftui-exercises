//
//  Arrow.swift
//  Drawings
//
//  Created by Sonja Ek on 22.10.2022.
//

import SwiftUI

struct Arrow: View {
    var body: some View {
        VStack(spacing: -25) {
            HStack {
                Rectangle()
                    .frame(width: 2, height: 30)
                    .rotationEffect(Angle(degrees: 20))
                Rectangle()
                    .frame(width: 2, height: 30)
                    .rotationEffect(Angle(degrees: -20))
            }
            Rectangle()
                .frame(width: 2, height: 200)
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow()
    }
}
