//
//  EditProfileView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/29/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?
    
    @StateObject var manager = EditProfileManager(imageUploader: ImageUploader())
    
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        Text("Change photo")
                    }
                }
                .task(id: selectedPickerItem) {
                    await loadImage(fromItem: selectedPickerItem)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    EditProfileOptionRowView(option: .name, value: user.fullname)
                    
                    EditProfileOptionRowView(option: .username, value: user.username)
                    
                    EditProfileOptionRowView(option: .bio, value: user.bio ?? "Add a bio")
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: EditProfileOptions.self) { option in
                EditProfileDetailView(option: option, user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        onDoneTapped()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

private extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        // photoPickerItem -> data -> UIImage -> Image
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            await manager.uploadProfileImage(uiImage)
            dismiss()
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}
