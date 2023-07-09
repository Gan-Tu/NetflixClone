//
//  HomeStack.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/2/23.
//

import SwiftUI

struct HomeStack : View {
    var vm : HomeViewModel
    var topRowSelection : HomeTopRow

    @Binding var movieDetailToShow: Movie?

    var body : some View {
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
                        ForEach(vm.getMovie(forCategory: category, andHomeTopRow: topRowSelection)) {movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 135, height: 200)
                                .onTapGesture(perform: {
                                    movieDetailToShow = movie
                                })
                        }
                    }
                })
            }
            .padding(.leading, 6)
        }
    }
}


struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView {
                HomeStack(vm: HomeViewModel(),
                          topRowSelection: .movies,
                          movieDetailToShow: .constant(nil))
            }
            .foregroundColor(.white)
        }
    }
}
