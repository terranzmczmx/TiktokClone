//
//  UserService.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/28/24.
//

import FirebaseAuth
import FirebaseFirestore

struct UserService {
    
    func uploadUserData(_ user: User) async throws {
        do {
            let userData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(userData)
        } catch {
            throw error
        }
    }
    
}
