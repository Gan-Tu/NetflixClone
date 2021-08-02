//
//  MovieDetail.swift
//  NetflixClone
//
//  Created by Gan Tu on 7/17/21.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    
    let screen = UIScreen.main.bounds
    
    @State private var showSeasonPicker = false
    @State private var selectedSeason = 1
    
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                VStack {
                    // START: Fixed close button
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // close this view
                            movieDetailToShow = nil
                        }, label: {
                            Image(systemName: "xmark.circle")
                                .font(.system(size: 28))
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.horizontal, 22)
                    // END: Fixed close button
                    
                    // START: Main Scrollable View
                    ScrollView(.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true) {
                        VStack {
                            
                            // Media Poster
                            StandardHomeMovie(movie: movie)
                                .frame(width: screen.width / 2.5)
                            
                            // Media Subheadline
                            MovieInfoSubheadline(movie: movie)
                            
                            // Media Promotion
                            if movie.promotionHeadline != nil {
                                Text(movie.promotionHeadline!)
                                    .bold()
                            }
                            
                            // Media Play Button
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .red) {
                                // TODO
                            }
                            
                            // Media Current Episode Information
                            CurrentEpisodeInformationView(movie: movie)
                            
                            // Media Casts
                            CastInfoView(movie: movie)
                            
                            // START: Media Interactive Buttons
                            HStack(spacing: 60) {
                                SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                                    // TODO
                                }
                                
                                SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: false) {
                                    // TODO
                                }
                                
                                SmallVerticalButton(text: "Share", isOnImage: "square.and.arrow.up", isOffImage: "square.and.arrow.up", isOn: true) {
                                    // TODO
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            // END: Media Interactive Buttons
                            
                            
                            // Tab Switchers
                            CustomTabSwitcher(showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason, tabs: [.episodes, .trailers, .more], movie: movie)
                            
                            
                        }
                        .padding(.horizontal, 10)
                    }
                    // END: Main Scrollable View
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                if showSeasonPicker {
                    Group {
                        Color.black.opacity(0.9)
                        
                        VStack(spacing: 40) {
                            Spacer()
                            
                            ForEach(1..<((movie.numberOfSeasons ?? 0) + 1)) { season in
                                Button(action: {
                                    self.selectedSeason = season
                                    self.showSeasonPicker = false
                                }, label: {
                                    Text("Season \(season)")
                                        .foregroundColor(selectedSeason == season ? .white : .gray)
                                        .bold()
                                        .font(selectedSeason == season ? .title : .title2)
                                })
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                self.showSeasonPicker = false
                            }, label: {
                                Image(systemName: "x.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                                    .scaleEffect(x: 1.1)
                            })
                            .padding(.bottom, 30)
                        }
                    }
                }
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: anotherLifeMovie, movieDetailToShow: .constant(nil))
        // MovieDetail(movie: exampleMovie5)
    }
}


struct MovieInfoSubheadline: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            
            Text(String(movie.year))
                .bold()
            
            RatingView(rating: movie.rating)
            
            Text(movie.numberOfSeasonsDisplay)
                .bold()
            
            QualityLabel(label: "HD")
        }
        .foregroundColor(.white)
        .padding(.vertical, 6)
    }
}

struct RatingView: View {
    var rating: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text(rating)
                .foregroundColor(.white)
                .font(.system(size: 10))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}

struct QualityLabel: View {
    var label: String
    var body: some View {
        Text(label)
            .bold()
            .padding(.vertical, 2)
            .padding(.horizontal, 2)
            .border(Color.gray)
            .foregroundColor(.white)
            .font(.system(size: 10))
    }
}

struct CastInfoView: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            HStack {
                Text("Cast: \(movie.casts)")
                Spacer()
            }
            
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(netflixGrayColor)
        .padding(.vertical, 10)
    }
}

struct CurrentEpisodeInformationView: View {
    var movie: Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDispaly)
                    .bold()
                
                Spacer()
            }
            .padding(.vertical, 4)
            
            HStack {
                Text(movie.episodeDescriptionDispaly)
                    .font(.subheadline)
                
                Spacer()
            }
        }
    }
}
