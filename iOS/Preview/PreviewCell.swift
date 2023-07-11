//
//  PreviewCell.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/10/23.
//

import SwiftUI
import KingfisherSwiftUI

struct PreviewCell: View {
    var movie: Movie;
    
    let colors: [Color] = [.yellow, .gray, .pink, .red, .green, .blue, .orange]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3.0)
                        // In real life, we should use color detections
                        .foregroundColor(
                            movie.movieColor != nil ? movie.movieColor! :
                                colors.randomElement())
                )
            
            if movie.previewImagesName != nil {
                Image(movie.previewImagesName!)
                    .resizable()
                    .scaledToFit()
                    .offset(y: -20)
                    .frame(height: 65)
            }
        }
    }
}

struct PreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            PreviewCell(movie: exampleMovie9)
                .frame(width: 165, height: 50)
        }
    }
}
