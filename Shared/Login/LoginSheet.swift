//
//  LoginSheet.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import SwiftUI

struct LoginSheet: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @State var sessionStore: SessionStore
    
    var body: some View {
        VStack {
            Spacer()
            Text("ChatExample-v1")
            Spacer()
        
            HStack {
                Image(systemName: "person")
                    .padding()
                VStack(alignment: .leading) {
                    Text("Username")
                    TextField("Username", text: $username)
                }
            }
            .padding()
            
            HStack {
                Image(systemName: "key")
                    .padding()
                VStack(alignment: .leading) {
                    Text("Password")
                    SecureField("Password", text: $password)
                }
            }
            .padding()
            
            Button(action: {
                
                //send login request here
//               showLoginSheet.toggle()
//                API().verifyToken(sessionStore: )
                sessionStore.login(username: username, password: password)
            }) {
                Text("Login")
            }
            
            Spacer()
        }
    }
    
    func performLogin() {
        
    }
}

struct LoginSheet_Previews: PreviewProvider {
    static var previews: some View {
        LoginSheet(sessionStore: SessionStore())
    }
}
