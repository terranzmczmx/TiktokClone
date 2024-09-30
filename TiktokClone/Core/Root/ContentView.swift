//
//  ContentView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    private let authService: AuthService
    private let userService: UserService
    
    init(authService: AuthService, userService: UserService) {
        self.authService = authService
        self.userService = userService
        
        let vm = ContentViewModel(authService: authService, userService: userService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView(authService: authService)
            } else {
                if let user = viewModel.currentUser {
                    MainTabView(authService: authService, user: user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authService: AuthService(), userService: UserService())
    }
}
