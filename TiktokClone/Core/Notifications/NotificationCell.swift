//
//  NotificationCell.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/5/24.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color(.systemGray5))
            HStack {
                Text("user ")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                Text("liked one of your posts wdfhgfh wdgygjdg sahkjdhk hhkhjk. ")
                    .font(.footnote) +
                Text("3d")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
