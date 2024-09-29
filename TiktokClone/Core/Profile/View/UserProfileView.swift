//
//  UserProfileView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/29/24.
//

import SwiftUI

struct UserProfileView: View {
    let user: User

    var body: some View {
        ScrollView {
            VStack {
                // profile header
                ProfileHeaderView(user: user)
                
                // post grid view
                PostGridView()
            }
            .padding(.top)
        }
//        .navigationTitle("Profile")
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItem {
//                Button("Sign Out") {
//                    authService.signout()
//                }
//                .font(.subheadline)
//                .fontWeight(.semibold)
//            }
//        }
    }
}

#Preview {
    UserProfileView(user: DeveloperPreview.user)
}
