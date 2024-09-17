//
//  RegistrationViewModel.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/13/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser(withEmail email: String,
                    password: String,
                    fullname: String,
                    username: String) async {
        do {
            try await authService.createUser(withEmail: email, 
                                             password: password,
                                             fullname: fullname,
                                             username: username)
        } catch {
            print("DEBUG: Create user Error with \(email). Error: \(error.localizedDescription)")
        }
    }
}
