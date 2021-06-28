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
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // main vstack
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack {
                    
                    TopMoviePreview(movie: anotherLifeMovie)
                        .frame(width: screen.width)
                        .padding(.top, -50)
                    
                    ForEach(vm.allCategories, id: \.self) {category in
                        VStack {
                            HStack {
                                Text(category)
                                    .font(.title3)
                                    .bold()
                                Spacer()
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false, content: {
                                LazyHStack {
                                    ForEach(vm.getMovie(forCategory: category)) {movie in
                                        StandardHomeMovie(movie: movie)
                                            .frame(width: 100, height: 200)
                                            .padding(.horizontal, 20)
                                    }
                                }
                            })
                        }
                    }
                }
            })
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
