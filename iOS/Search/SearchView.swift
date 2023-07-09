//
//  SearchView.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchViewModel()
    @State private var searchText = ""
    @State private var movieDetailToShow: Movie? = nil
    
    var body: some View {
        
        //    // An alternative using custom binding is used to inject logics
        //    let searchTextBinding = Binding {
        //        return searchText
        //    } set : {
        //        searchText = $0
        //        vm.updateSearchResults(with: $0)
        //    }
        
        return ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: $searchText, isLoading: $vm.isLoading)
                    .onChange(of: searchText, perform: { searchText in
                        vm.updateSearchResults(with: searchText)
                    })
                    .padding()
                
                ScrollView {
                    if vm.isShowingPopularMovies {
                        PopularList(movies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    } else if vm.searchState == .empty {
                        Text("Your serach did not have any results.")
                            .bold()
                            .padding(.top, 150)
                    } else if vm.searchState == .ready {
                        SearchResultList(movies: vm.searchResults, movieDetailToShow: $movieDetailToShow)
                    }
                }
                
                Spacer()
            }
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}


struct PopularList: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            Text("Popular Searches")
                .bold()
                .font(.title3)
                .padding(.leading, 12)
            HStack {
                LazyVStack {
                    ForEach(movies, id: \.id) { movie in
                        PopularMovieView(movie: movie, movieDetailToShow: $movieDetailToShow)
                            .frame(height: 80)
                    }
                }
            }
        }
    }
}


struct SearchResultList: View {
    var movies: [Movie]
    
    @Binding var movieDetailToShow: Movie?
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Movies & TV")
                    .bold()
                    .font(.title3)
                    .padding(.leading, 12)
                Spacer()
            }
            
            HStack {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(movies, id: \.id) {movie in
                        StandardHomeMovie(movie: movie)
                            .frame(height: 160)
                            .onTapGesture(perform: {
                                movieDetailToShow = movie
                            })
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
