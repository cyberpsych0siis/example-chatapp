//
//  FriendController.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 19.04.22.
//

import Foundation
import SwiftUI

class FriendController {
    private var id: Int
    @State var name: String = "Unknown User"
    @State var publicKey: String = "unknown key"
    
    init(_ id: Int) {
        self.id = id
//        self.fetch()
    }
    
    func fetch() {
        API().fetchFriends {
            data in
            
            let data = data.filter {
                d in
                return d.id == self.id
            }
            
            let foundFriend = data[0]
        }
    }
}
