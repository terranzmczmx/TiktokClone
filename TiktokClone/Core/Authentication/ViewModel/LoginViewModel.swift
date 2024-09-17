//
//  LoginViewModel.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/13/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do {
            try await authService.login(withEmail: email, password: password)
        } catch {
            print("DEBUG: Login Error with \(email). Error: \(error.localizedDescription)")
        }
    }
}
