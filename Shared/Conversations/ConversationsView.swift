//
//  ConversationsView.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var messages: [PostData] = []
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(messages) {
                    message in
                    NavigationLink(destination: ConversationDetail(message: message)) {
                        ConversationListItem(message: message)
                    }
                }
            }
            .onAppear {
                API().fetchMessages { data in
                    messages = data
                }
        }
            .navigationTitle(Text("Conversations"))
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
