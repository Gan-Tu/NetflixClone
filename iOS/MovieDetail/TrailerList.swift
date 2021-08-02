//
//  TrailerList.swift
//  NetflixClone
//
//  Created by Gan Tu on 8/1/21.
//

import SwiftUI

struct TrailerList: View {
    var trailers: [Trailer]
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURl: trailer.thumbnailImageURL, videoURL: trailer.videoUrl)
                        .frame(maxWidth: screen.width)
                    
                    Text(trailer.name)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TrailerList(trailers:exampleTrailers)
        }
    }
}
