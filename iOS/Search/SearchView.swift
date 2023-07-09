//
//  SearchView.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        //    // An alternative using custom binding is used to inject logics
        //    let searchTextBinding = Binding {
        //        return searchText
        //    } set : {
        //        searchText = $0
        //        vm.updateSearchResults(with: $0)
        //    }
        
        return ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                SearchBar(text: $searchText, isLoading: $vm.isLoading)
                    .padding()
                    .onChange(of: searchText, perform: { searchText in
                        vm.updateSearchResults(with: searchText)
                    })
                
                if vm.isShowingPopularMovies {
                    Text("Popular Movies")
                } else if vm.searchState == .ready {
                    Text("Search Results")
                } else if vm.searchState == .empty {
                    Text("Empty")
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
