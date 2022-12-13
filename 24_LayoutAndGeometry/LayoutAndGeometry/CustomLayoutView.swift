//
//  CustomLayoutView.swift
//  LayoutAndGeometry
//
//  Created by Sonja Ek on 13.12.2022.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomLayoutView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@iosonja")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("CV_potretti")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 84, height: 84)
                    .padding(30)
            }

            VStack {
                Text("The following name will vertically align with the GitHub handle no matter what happens to the surrounding elements.")
                    .padding()
                Text("Full name:")
                Text("SONJA EK")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct CustomLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLayoutView()
    }
}
