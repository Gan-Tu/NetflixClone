//
//  TrailerPlayerView.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var videoURL: URL?
    
    @Binding var playVideo: Bool
    
    var body: some View {
        if videoURL != nil {
            VideoPlayer(url: videoURL!, play: $playVideo)
        } else {
            Text("Could not load video")
        }
    }
}

#Preview("Working") {
    TrailerPlayerView(videoURL: exampleVideoURL, playVideo: .constant(false))
}

#Preview("Failure") {
    TrailerPlayerView(videoURL: nil, playVideo: .constant(true))
}
