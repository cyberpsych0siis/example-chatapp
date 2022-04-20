//
//  TestApp2App.swift
//  Shared
//
//  Created by Philipp Gaßner on 17.04.22.
//

import SwiftUI

@main
struct TestApp2App: App {
    
    var sessionStore = SessionStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sessionStore)
        }
    
    }
}
