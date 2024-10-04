//
//  EditProfileDetailView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 10/2/24.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var value = ""
    private let option: EditProfileOptions
    private var user: User
    
    init(option: EditProfileOptions, user: User) {
        self.option = option
        self.user = user
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add your bio", text: $value)
                
                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Divider()
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top)
            
            Spacer()
        }
        .padding()
        .onAppear { onViewAppear() }
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {}
                    .fontWeight(.semibold)
            }
        }
    }
}

private extension EditProfileDetailView {
    var subtitle: String {
        switch option {
        case .name:
            return "Your full name can only be changed once every 7 days"
        case .bio:
            return "Tell us a little bit about yourself"
        case .username:
            return "Username can contian only letters, numbers, underscores, and periods."
        }
    }
    
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullname
        case .bio:
            value = user.bio ?? ""
        case .username:
            value = user.username
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(option: .name, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
