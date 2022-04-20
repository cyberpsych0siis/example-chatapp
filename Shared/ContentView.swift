//
//  ContentView.swift
//  Shared
//
//  Created by Philipp Gaßner on 17.04.22.
//

import SwiftUI
import Combine

struct ContentView: View {
    //    @Environment(\.loginToken) var token: String? = nil
    @State var selection: Int = 1
    @EnvironmentObject var sessionStore: SessionStore
    
    var body: some View {
//        if !API().isTokenValid() {
//            LoginSheet()
////                .environmentObject($showLoginScreen)
//        } else {
        
        if self.sessionStore.isLoggedIn() {
            ZStack {
                TabView(selection: $selection) {
                        ConversationsView().tabItem {
                            Image(systemName: "tray")
                            Text("Conversations")
                        }.tag(1)
                        FriendsList().tabItem {
                            Image(systemName: "person")
                            Text("Friends")
                        }
                        Text("Settings").tabItem {
                            Image(systemName: "gear")
                            Text("Settings")
                        }.tag(2)
                }
            }
        } else {
            LoginSheet(sessionStore: sessionStore)
        }
        
//        onChange(of: sessionStore.isLoggedIn()) {newValue in
//            
//        }
//        }
    }
    
    func logMeIn() {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
//            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
