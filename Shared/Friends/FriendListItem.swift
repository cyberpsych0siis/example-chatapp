//
//  FriendListItem.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import SwiftUI

struct FriendListItem: View {
    @State var friend: Friend
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .padding()
//                .background(.blue)
            VStack(alignment: .leading) {
                Text(friend.name)
                    .bold()
                
                Text(friend.origin)
                
            }
            Spacer()
        }
    }
}

struct FriendListItem_Previews: PreviewProvider {
    static var previews: some View {
        FriendListItem(friend: Friend(id: 0, name: "Preview", public_key: "none", origin: "internal", comment: "preview"))
    }
}
