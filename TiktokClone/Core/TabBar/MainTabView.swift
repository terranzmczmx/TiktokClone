//
//  MainTabView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/3/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Feed")
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            Text("Friends")
                .tabItem {
                    VStack {
                        Image(systemName: "person.2")
                        Text("Friends")
                    }
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus")
                }
            Text("Notifications")
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                        Text("Inbox")
                    }
                }
            Text("Profile")
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
