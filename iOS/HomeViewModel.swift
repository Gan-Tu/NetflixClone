//
//  HomeViewModel.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import Foundation

class HomeViewModel : ObservableObject {
    // String == Category
    @Published var movies: [String: [Movie]] = [:]
    
    public var allCategories: [String] {
        return movies.keys.map{ String($0) }
    }
    
    public func getMovie(forCategory category: String) -> [Movie] {
        return movies[category] ?? []
    }
    
    init() {
        setupMovies()
    }
    
    func setupMovies() {
        movies["Watch It Again"] = exampleMovies.shuffled()
        movies["Trending Now"] = exampleMovies.shuffled()
        movies["Stand-Up Comedy"] = exampleMovies.shuffled()
        movies["Sci-Fi Movies"] = exampleMovies.shuffled()
        movies["New Releases Movies"] = exampleMovies.shuffled()
    }
}
