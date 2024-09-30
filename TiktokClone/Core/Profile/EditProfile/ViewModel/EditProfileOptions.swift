//
//  EditProfileOptions.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/29/24.
//

import Foundation

enum EditProfileOptions: Hashable {
    case name
    case username
    case bio
    
    var title: String {
        switch self {
        case .name:
            return "Name"
        case .username:
            return "username"
        case .bio:
            return "Bio"
        }
    }
}
