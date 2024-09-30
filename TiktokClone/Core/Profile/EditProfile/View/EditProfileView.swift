//
//  EditProfileView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/29/24.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Circle()
                        .frame(width: 64, height: 64)
                    
                    Button("Change Photo") {
                        print("DEBUG: change photo...")
                    }
                    .foregroundStyle(.black)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .foregroundStyle(Color(.systemGray2))
                        .fontWeight(.semibold)
                    
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text("name...")
                    }
                    
                    HStack {
                        Text("Username")
                        
                        Spacer()
                        
                        Text("username...")
                    }
                    
                    HStack {
                        Text("Bio")
                        
                        Spacer()
                        
                        Text("bio...")
                    }
                }
                .font(.subheadline)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
