//
//  PopularMovieView.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularMovieView: View {
    var movie: Movie
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        GeometryReader {proxy in
            HStack {
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width / 3)
                
                Text(movie.name)
                
                Spacer()
                
                Button(action: {
                    movieDetailToShow = movie
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing, 20)
            }
            .foregroundColor(.white)
            .onTapGesture {
                movieDetailToShow = movie
            }
        }
    }
}

struct PopularMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PopularMovieView(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}
