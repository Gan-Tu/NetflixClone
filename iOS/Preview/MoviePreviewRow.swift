//
//  MoviePreviewRow.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/10/23.
//

import SwiftUI

struct MoviePreviewRow: View {
    var movies: [Movie]
    @Binding var showPreviewFullScreen: Bool
    @Binding var previewStartingIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title2)
                .bold()
                .padding(.leading, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<movies.count, id: \.self, content: {index in
                        PreviewCell(movie: movies[index])
                            .frame(width: 120, height: 120)
                            .padding(.trailing, 15)
                            .padding(.leading, 6)
                            .onTapGesture {
                                previewStartingIndex = index
                                showPreviewFullScreen = true
                            }
                    })
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            MoviePreviewRow(movies: previewMovies, showPreviewFullScreen: .constant(false), previewStartingIndex: .constant(0))
                .frame(height: 200)
        }
        
    }
}
