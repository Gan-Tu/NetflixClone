//
//  PreviewList.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import SwiftUI

struct PreviewList: View {
    var movies: [Movie]
    
    @Binding var currentSelection: Int
    @Binding var isVisible: Bool
    
    @State private var currentTranslation: CGFloat = .zero
    
    func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false;
        }
        return index == currentSelection
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PagerView(pageCount: movies.count, currentIndex: $currentSelection, translation: $currentTranslation, content: {
                ForEach(0..<movies.count, id: \.self) {movieIndex in
                    PreviewView(vm: PreviewViewModel(movie: movies[movieIndex]), playVideo: shouldPlayVideo(index: movieIndex))
                }
            })
        }
    }
}

struct PreviewListPreviewWrapper: View {
    var movies: [Movie]

    @State private var currentSelection = 0;
    @State private var isVisible = true
    
    var body: some View {
        PreviewList(
            movies: movies,
            currentSelection: $currentSelection,
            isVisible: $isVisible
        )
    }
}

#Preview {
    PreviewListPreviewWrapper(movies: previewMovies)
}
