//
//  AuthService.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/13/24.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthService {
    @Published var userSession: FirebaseAuth.User?
    private let userService = UserService()
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to login user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    fullname: String,
                    username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, id: result.user.uid, fullname: fullname, username: username)
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout() {
        try? Auth.auth().signOut() // signs user out on backend
        self.userSession = nil // updates routing logic by wiping user session
    }
    
    private func uploadUserData(withEmail email: String,
                                id: String,
                                fullname: String,
                                username: String) async throws {
        let user = User(id: id, username: username, email: email, fullname: fullname)
        try await userService.uploadUserData(user)
    }
}
