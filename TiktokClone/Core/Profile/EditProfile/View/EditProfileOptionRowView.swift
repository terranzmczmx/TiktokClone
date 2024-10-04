//
//  EditProfileOptionRowView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 10/3/24.
//

import SwiftUI

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    
    var body: some View {
        NavigationLink(value: option) {
            HStack {
                Text(option.title)
                
                Spacer()
                
                Text(value)
            }
        }
        .foregroundStyle(.primary)
    }
}

#Preview {
    EditProfileOptionRowView(option: .username, value: "lewis.hamilton")
}
