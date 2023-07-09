//
//  SearchViewModel.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import Foundation
import SwiftUI

class SearchViewModel : ObservableObject {
    @Published var searchState: SearchState = .ready
    @Published var isLoading: Bool = false
    
    @Published var popularMovies: [Movie] = []
    @Published var searchResults: [Movie] = []
    @Published var isShowingPopularMovies = true
    
    init() {
        // For now, generate fake popular results
        self.popularMovies = generateMovies(40)
    }
    
    public func updateSearchResults(with text: String) {
        setViewState(to: .loading)
        if text.count > 0{
            isShowingPopularMovies = false
            getSearchResults(forText: text)
        } else {
            isShowingPopularMovies = true
        }
    }
    
    private func getSearchResults(forText text: String) {
        // For now, simulate random search results, with possibility of empty
        DispatchQueue.main.asyncAfter(deadline:. now() + 1) {
            if Int.random(in: 0...3) == 0 {
                self.searchResults = []
                self.setViewState(to: .empty)
            } else {
                let movies = generateMovies(21);
                self.searchResults = movies
                self.setViewState(to: .ready)
            }
        }
    }
    
    private func setViewState(to state: SearchState) {
        // Run on main thread to avoid issues with UI update
        DispatchQueue.main.async {
            self.searchState = state
            self.isLoading = state == .loading
        }
    }
}


enum SearchState {
    case empty
    case loading
    case ready
    case error
}
