//
//  EditProfileManager.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 10/4/24.
//

import UIKit
import FirebaseAuth
import Firebase

class EditProfileManager: ObservableObject {
    private let imageUploader: ImageUploader
    
    init(imageUploader: ImageUploader) {
        self.imageUploader = imageUploader
    }
    
    func uploadProfileImage(_ uiImage: UIImage) async {
        do {
            let profileImageUrl = try await imageUploader.uploadImage(image: uiImage)
            try await updateUserProfileImageUrl(profileImageUrl)
        } catch {
            print("DEBUG: Failed to upload profile image to database with error: \(error)")
        }
    }
    
    private func updateUserProfileImageUrl(_ imageUrl: String?) async throws {
        guard let imageUrl else { return }
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        try await FirestoreConstants.UserCollection.document(currentUid).updateData([
            "profileImageUrl": imageUrl
        ])
    }
}
