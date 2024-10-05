//
//  AvatarView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 10/4/24.
//

import SwiftUI
import Kingfisher

struct AvatarView: View {
    let user: User?
    let size: AvatarSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    VStack {
        AvatarView(user: DeveloperPreview.user, size: .xxSmall)
        AvatarView(user: DeveloperPreview.user, size: .xSmall)
        AvatarView(user: DeveloperPreview.user, size: .small)
        AvatarView(user: DeveloperPreview.user, size: .medium)
        AvatarView(user: DeveloperPreview.user, size: .large)
        AvatarView(user: DeveloperPreview.user, size: .xLarge)
    }
}
