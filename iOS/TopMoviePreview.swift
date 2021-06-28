//
//  TopMoviePreview.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    var movie: Movie;
    
    func isLastCategory(_ cat: String) -> Bool {
        if let lastCategory = movie.categories.last {
            return lastCategory == cat;
        }
        return false
    }
    
    var body: some View {
        ZStack {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()

                HStack {
                    ForEach(movie.categories, id: \.self) {category in
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !isLastCategory(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }.padding(.bottom, 5)
                    }
                }
                
                HStack {
                    Spacer()

                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                        // to be done
                    }
                    
                    Spacer()
                    
                    WhiteButton(text: "Play", imageName: "play.fill") {
                        // action
                    }
                    .frame(width: 100)
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: true) {
                        // to be done
                    }
                    
                    Spacer()
                }
            }
        }.foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: anotherLifeMovie)
    }
}
