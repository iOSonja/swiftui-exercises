//
//  GroupedElementsView.swift
//  AccessibilityProject
//
//  Created by Sonja Ek on 14.11.2022.
//

import SwiftUI

struct GroupedElementsView: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
    }
}

struct GroupedElementsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupedElementsView()
    }
}
