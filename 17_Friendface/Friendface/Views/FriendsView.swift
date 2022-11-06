//
//  FriendsView.swift
//  FriendFace
//
//  Created by Sonja Ek on 6.11.2022.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct FriendsView: View {
    let friends: [CachedFriend]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(friends) { friend in
                    Text(friend.wrappedName)
                        .titleStyle()
                        .padding(3)
                }
            }
        }
    }
}

// struct FriendsView_Previews: PreviewProvider {
//     static var previews: some View {
//         FriendsView(friends: User.example.friends)
//     }
// }
