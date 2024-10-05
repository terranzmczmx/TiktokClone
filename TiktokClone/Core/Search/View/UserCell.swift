//
//  UserCell.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/4/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            AvatarView(user: user, size: .medium)
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
            }
            .foregroundStyle(.black)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.user)
}
