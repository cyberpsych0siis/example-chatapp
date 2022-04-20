//
//  SessionStore.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 20.04.22.
//

import Foundation

struct Token: Identifiable, Hashable, Codable {
    var id = UUID()
    var token: String
    
    private enum CodingKeys: String, CodingKey {
        case token
    }
}

final class SessionStore: ObservableObject {
    @Published var token: Token = Token(token: "")
    
    func login(username: String, password: String) {
        API().login(username: username, password: password) {
            token in
            self.setToken(token.token)
        }
    }
    
    func setToken(_ token: String) {
        self.token = Token(token: token)
    }
    
    func invalidateToken() {
        self.token = Token(token: "")
    }
    
    func isLoggedIn() -> Bool {
        return self.token.token != ""
    }
}
