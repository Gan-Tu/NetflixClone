//
//  ComingSoonRow.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI
import KingfisherSwiftUI

struct ComingSoonRow: View {
    var movie: Movie
    @Binding var movieDetailToShow: Movie?
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            
            KFImage(movie.thumbnailURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250, alignment: .center)
                .clipped()
            
            HStack {
                Text(movie.name)
                    .font(.title2)
                
                Spacer()
                
                Button(action: {
                    // remind me
                }, label: {
                    VStack(spacing: 6) {
                        Image(systemName: "bell")
                        Text("Remind me")
                    }
                })
                .padding(.horizontal)
                
                Button(action: {
                    movieDetailToShow = movie
                }, label: {
                    VStack(spacing: 6) {
                        Image(systemName: "info.circle")
                        Text("Info")
                    }
                })
                .padding(.trailing, 24)
            }
            .font(.callout)
            .padding(.bottom, 10)
            
            Text(movie.episodeDescriptionDispaly)
                .foregroundColor(.white)
                .font(.subheadline)
        }
    }
}

//struct ComingSoonRow: View {
//    var movie: Movie
//    @Binding var movieDetailToShow: Movie?
//
//    let screen = UIScreen.main.bounds
//
//    var body: some View {
//        VStack {
//
//            ZStack {
//                Color.black.frame(height: 200)
//                Text("Video autoplay Here")
////                SwiftUIVideoViews(url: exampleVideoURL)
////                    .frame(height: 200)
//            }
//            .foregroundColor(.white)
//
//            VStack {
//                HStack {
//                    KFImage(movie.thumbnailURL)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: screen.size.width/3, height: 75, alignment: .center)
//                        .clipped()
//
//                    Spacer()
//
//                    Button(action: {
//                        // remind me
//                    }, label: {
//                        VStack(spacing: 6) {
//                            Image(systemName: "bell")
//                            Text("Remind me")
//                        }
//                    })
//                    .padding(.horizontal)
//
//                    Button(action: {
//                        movieDetailToShow = movie
//                    }, label: {
//                        VStack(spacing: 6) {
//                            Image(systemName: "info.circle")
//                            Text("Info")
//                        }
//                    })
//                    .padding(.trailing, 24)
//                }
//                .font(.callout)
//
//                VStack(alignment: .leading, spacing: 5, content: {
//                    Text(movie.name)
//                        .font(.title2)
//                    Text(movie.episodeDescriptionDispaly)
//                        .foregroundColor(.gray)
//                        .font(.subheadline)
//                })
//            }
//            .padding(.horizontal)
//        }
//    }
//}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ComingSoonRow(movie: exampleMovie1, movieDetailToShow: .constant(nil))
        }
        .foregroundColor(.white)
    }
}
