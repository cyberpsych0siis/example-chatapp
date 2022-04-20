//
//  ConversationDetail.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import SwiftUI

struct ConversationDetail: View {
    
    @State var message: PostData
    
    var body: some View {
//        let frienddata = FriendController(message.from)
        HStack {
            VStack(alignment: .leading) {
            Text(message.title)
                    .fontWeight(.heavy)
//                frienddata.fetch {
//                    d in
//                    Text("From: \(d.name)")
//                }
//                Text("From: \(frienddata.name)")
                ScrollView {
                    Text(message.body)
                }
            }
            Spacer()
        }
        .padding()
        Spacer()
    }
}


struct ConversationDetail_Previews: PreviewProvider {
    static var previews: some View {
        ConversationDetail(message: PostData(id: 0, title: "Preview", from: 0, body: "Preview"))
    }
}
