//
//  Firestore+Constants.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/29/24.
//

import FirebaseFirestore

struct FirestoreConstants {
    static let Root = Firestore.firestore()
    
    static let UserCollection = Root.collection("users")
}
