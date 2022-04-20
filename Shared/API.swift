//
//  API.swift
//  TestApp2
//
//  Created by Philipp Gaßner on 18.04.22.
//

import SwiftUI
//import Foundation

struct ItemData: Codable & Identifiable {
    var id: Int
    var name: String
    var type: String
    var uri: String
}

struct PostData: Codable & Identifiable {
    var id: Int
    var title: String
    var from: Int
    var body: String
    
    private enum CodingKeys: String, CodingKey {
        case id, title, from, body
    }
}

struct Friend : Codable & Identifiable {
    var id: Int
    var name: String
    var public_key: String
    var origin: String
    var comment: String
}

class API {
    private var host = "https://u703.de"
    
    func verifyToken(_ callback: @escaping (Token) -> ()) {
        self.load(suffix: "/token.json") {
            data in
            let d = try! JSONDecoder().decode(Token.self, from: data)
            callback(d)
        }
    }
    
    func login(username: String, password: String, _ callback: @escaping (Token) -> ()) {
        print("Login \(username) \(password)")
        self.post(suffix: "/login", payload: ["user": username, "password": password]) {
            tokenResp in
            let t = try! JSONDecoder().decode(Token.self, from: tokenResp)
            
            callback(t)
        }
    }
    
    func fetchFriends(_ complete: @escaping ([Friend]) -> ()) {
        self.load(suffix: "/friends.json") {
            data in
            
            let decoder = JSONDecoder()
            let list = try! decoder.decode([Friend].self, from: data)
            complete(list)
        }
    }
    
    func fetchMessages(_ complete: @escaping ([PostData]) -> ()) {
        self.load(suffix: "/data.json") {
            data in
            
            print()
            
            let decoder = JSONDecoder()
            let list = try! decoder.decode([PostData].self, from: data)
            complete(list)
        }
    }
    
    func load(suffix: String, _ onLoadCompleteCallback: @escaping (Data) -> ()) {
        let url = URL(string: "\(self.host + suffix)")!

        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            guard let data = data else { return }
            
            print (data)
            
            onLoadCompleteCallback(data)
        }

        task.resume()
    }
    
    func post(suffix: String, payload: [String: String], _ onLoadCompleteCallback: @escaping (Data) -> ()) {
        let url = URL(string: "\(self.host + suffix)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            // convert parameters to Data and assign dictionary to httpBody of request
            let d = try JSONSerialization.data(withJSONObject: payload)
            print("\(d.base64EncodedString())")
            request.httpBody = d
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            let httpResponse = response as! HTTPURLResponse
            print("\(httpResponse.statusCode)")
            
            // ensure there is data returned
            guard let responseData = data else {
              print("nil Data received from the server")
              return
            }
            
            onLoadCompleteCallback(responseData)
        }
        
        task.resume()
    }
}
