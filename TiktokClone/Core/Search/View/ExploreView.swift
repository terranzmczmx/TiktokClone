//
//  ExploreView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/4/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel(userService: UserService())
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self, destination: { user in
                UserProfileView(user: user)
            })
            .padding(.top)
        }
    }
}

#Preview {
    ExploreView()
}
