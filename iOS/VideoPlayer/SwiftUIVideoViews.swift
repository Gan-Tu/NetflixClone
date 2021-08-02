//
//  SwiftUIVideoViews.swift
//  NetflixClone
//
//  Created by Gan Tu on 8/1/21.
//

import SwiftUI
import AVKit

struct SwiftUIVideoViews: View {
    var url: URL
    
    private var player: AVPlayer {
        AVPlayer(url: url)
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

struct SwiftUIVideoViews_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIVideoViews(url: exampleVideoURL)
    }
}
