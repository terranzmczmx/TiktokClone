//
//  FeedView.swift
//  TiktokClone
//
//  Created by Yingzhe Hu on 9/4/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    @State private var playerStatus = AVPlayer.TimeControlStatus.playing
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear {
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
        .onAppear {
            switch playerStatus {
            case .paused:
                player.pause()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.play()
            @unknown default:
                break
            }
        }
        .onDisappear {
            playerStatus = player.timeControlStatus
            player.pause()
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard
            scrollPosition == nil,
            let post = viewModel.posts.first,
            player.currentItem == nil else { return }
        
        let playerItem = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let postId = postId else { return }
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
}

#Preview {
    FeedView()
}
