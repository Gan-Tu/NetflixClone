//
//  PreviewViewModel.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import Foundation
import SwiftUI

class PreviewViewModel: ObservableObject {
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var accentColor: Color {
        return (movie.movieColor != nil) ? movie.movieColor! : .accentColor
    }
}
