//
//  HomeView.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import SwiftUI

struct HomeView: View {
    
    var vm : HomeViewModel = HomeViewModel()
    
    let screen = UIScreen.main.bounds
    
    @State private var movieDetailToShow: Movie? = nil
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .allGenres
    @State private var showGenreSelection = false
    @State private var showTopRowSelection = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // main vstack
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack {
                    
                    TopRowButtonView(topRowSelection: $topRowSelection,
                                     homeGenre: $homeGenre,
                                     showGenreSelection:$showGenreSelection,
                                     showTopRowSelection: $showGenreSelection
                    )
                    
                    TopMoviePreview(movie: anotherLifeMovie)
                        .frame(width: screen.width)
                        .padding(.top, -100)
                        .zIndex(-1.0)
                    
                    HomeStack(vm: vm, topRowSelection: topRowSelection, movieDetailToShow: $movieDetailToShow)
                }
            })
            
            if movieDetailToShow != nil {
                MovieDetail(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtonView: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre

    @Binding var showGenreSelection: Bool
    @Binding var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })

                HStack() {
                    Spacer()
                    
                    Button(action: {
                        topRowSelection = .tvShows
                    }, label: {
                        Text("TV Shows")
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()

                    Button(action: {
                        topRowSelection = .movies
                    }, label: {
                        Text("Movies")
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()

                    Button(action: {
                        topRowSelection = .myList
                    }, label: {
                        Text("My List")
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .font(.system(size: 16))
            }
            .padding(.leading, 10)
            .padding(.trailing, 50)
        case .tvShows, .movies, .myList:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })

                HStack(spacing: 20) {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 16))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 16))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 50)
        }
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}

enum HomeGenre: String {
    case allGenres = "All Genres"
    case action = "Action"
    case comedy = "Comedy"
    case horror = "Horror"
    case thirller = "Thriller"
}
