//
//  ComingSoonViewModel.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import Foundation

class ComingSoonViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        movies = generateMovies(10)
    }
}
