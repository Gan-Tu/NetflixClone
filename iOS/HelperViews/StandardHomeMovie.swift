//
//  StandardHomeMovie.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import SwiftUI
import KingfisherSwiftUI

struct StandardHomeMovie: View {
    var movie: Movie

    var body: some View {
//        KFImage(movie.thumbnailURL)
//            .resizable()
//            .scaledToFill()
//            .clipped()
        GeometryReader { proxy in
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                .clipped()
        }
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
    }
}
