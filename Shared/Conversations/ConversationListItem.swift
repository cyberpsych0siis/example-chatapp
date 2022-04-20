//
//  ConversationListItem.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import SwiftUI

struct ConversationListItem: View {
    @State var message: PostData
    
    var body: some View {
        HStack {
            Image(systemName: "person")
                .padding()
//                .background(.blue)
            VStack(alignment: .leading) {
                Text(message.title)
                    .bold()
                
                Text(message.body)
                
            }
            Spacer()
        }
    }
}

struct ConversationListItem_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListItem(message: PostData(
            id: 0,
            title: "Preview",
            from: 0,
            body: "Preview"
        ))
    }
}
