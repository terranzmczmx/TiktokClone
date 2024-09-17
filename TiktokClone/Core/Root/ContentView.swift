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
    
    init(authService: AuthService) {
        self.authService = authService
        let vm = ContentViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView(authService: authService)
            } else {
                MainTabView(authService: authService)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authService: AuthService())
    }
}
