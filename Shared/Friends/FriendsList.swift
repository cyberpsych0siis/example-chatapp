//
//  FriendsList.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import SwiftUI

struct FriendsList: View {
    @State private var friends: [Friend] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) {
                    friend in
                    NavigationLink(destination: Text(friend.public_key)) {
//                        ConversationListItem(message: message
                        FriendListItem(friend: friend)
                    }
                }
            }
            .onAppear {
                API().fetchFriends { data in
                    friends = data
                }
        }
            .navigationTitle(Text("Friends"))
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
    }
}
