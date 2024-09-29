//
//  User.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/28/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let username: String
    let email: String
    let fullname: String
    var bio: String?
    var profileImageUrl: String?
}
