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
    
    var homeExampleMovies : [Movie] {
        let allMovies = [anotherLifeMovie] + exampleMovies
        return allMovies.shuffled()
    }
    
    func setupMovies() {
        movies["Watch It Again"] = homeExampleMovies
        movies["Trending Now"] = homeExampleMovies
        movies["Stand-Up Comedy"] = homeExampleMovies
        movies["Sci-Fi Movies"] = homeExampleMovies
        movies["New Releases Movies"] = homeExampleMovies
    }
}
