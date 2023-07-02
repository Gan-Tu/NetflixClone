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
    
    public func getMovie(forCategory category: String, andHomeTopRow homeRow: HomeTopRow) -> [Movie] {
        switch homeRow {
        case .home:
            return movies[category] ?? []
        case .tvShows:
            return (movies[category] ?? []).filter({ $0.movieType == .tvShow })
        case .movies:
            return (movies[category] ?? []).filter({ $0.movieType == .movies })
        case .myList:
            // TOOD: implement this
            return []
        }
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
