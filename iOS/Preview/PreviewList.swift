//
//  PreviewList.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import SwiftUI

struct PreviewList: View {
    @EnvironmentObject var controller: PreviewController
    var movies: [Movie]
    
    @State private var currentTranslation: CGFloat = .zero
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PagerView(pageCount: movies.count, content: {
                ForEach(0..<movies.count, id: \.self) {movieIndex in
                    PreviewView(vm: PreviewViewModel(movie: movies[movieIndex]), playVideo: controller.shouldPlayVideo(index: movieIndex))
                }
            })
        }
    }
}

struct PreviewListPreviewWrapper: View {
    var controller = PreviewController()
    var movies: [Movie]
    
    var body: some View {
        PreviewList(movies: movies)
            .environmentObject(controller)
    }
}

#Preview {
    PreviewListPreviewWrapper(movies: previewMovies)
}
