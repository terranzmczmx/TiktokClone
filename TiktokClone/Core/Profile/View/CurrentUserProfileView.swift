//
//  CurrentUserProfileView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/5/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let authService: AuthService
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // profile header
                    ProfileHeaderView(user: user)
                    
                    // post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Sign Out") {
                        authService.signout()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService(), user: DeveloperPreview.user)
}
