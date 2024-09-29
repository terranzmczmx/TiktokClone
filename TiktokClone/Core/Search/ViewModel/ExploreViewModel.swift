//
//  ExploreViewModel.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/28/24.
//
import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
        Task { await fetchUsers() }
    }
    
    @MainActor
    func fetchUsers() async {
        do {
            self.users = try await userService.fetchUsers()
        } catch {
            print("DEBUG: Failed to fetch users from firestore with error: \(error.localizedDescription)")
        }
    }
}
