//
//  DetailView.swift
//  FriendFace
//
//  Created by Sonja Ek on 6.11.2022.
//

import SwiftUI

struct DetailView: View {
    let user: User

    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text(user.name)
                        .font(.largeTitle)
                    Text(user.company)
                        .font(.title2)
                }
                .padding()

                HStack {
                    Circle()
                        .fill(user.isActive ? .green : .red)
                        .frame(width: 15)
                    
                    Text(user.isActive ? "Online" : "Offline")
                }
                .padding()

                Divider()

                VStack {
                    VStack(alignment: .leading) {
                        Text("About me")
                            .fontWeight(.bold)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                        Text(user.about)
                    }

                    HStack {
                        Spacer()
                        Text("Registered \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                            .fontWeight(.thin)
                            .padding()
                    }
                }
                .padding()

                Spacer()

                Divider()
                VStack(alignment: .leading) {
                    Text("Friends")
                        .fontWeight(.bold)
                        .padding()
                    FriendsView(friends: user.friends)
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.example)
    }
}
