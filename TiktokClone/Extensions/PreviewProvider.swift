//
//  PreviewProvider.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/28/24.
//

import Foundation

struct DeveloperPreview {
    static var user = User(id: NSUUID().uuidString, username: "tester1", email: "tester1@gmail.com", fullname: "tester 1")
    
    static var users: [User] = [
        .init(id: NSUUID().uuidString, username: "tester1", email: "tester1@gmail.com", fullname: "tester 1"),
        .init(id: NSUUID().uuidString, username: "tester2", email: "tester2@gmail.com", fullname: "tester 2"),
        .init(id: NSUUID().uuidString, username: "tester3", email: "tester3@gmail.com", fullname: "tester 3"),
        .init(id: NSUUID().uuidString, username: "tester4", email: "tester4@gmail.com", fullname: "tester 4")
    ]
}
