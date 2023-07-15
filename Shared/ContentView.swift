//
//  ContentView.swift
//  Shared
//
//  Created by Gan Tu on 6/27/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex: Int = 0
    
    @State private var previewCurrentPos: CGFloat = 1000
    
    let screen = UIScreen.main.bounds
    
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    
    var body: some View {
        ZStack {
            TabView {
                HomeView(
                    showPreviewFullScreen: $showPreviewFullScreen,
                    previewStartingIndex: $previewStartingIndex)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag("home")
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag("search")
                
                ComingSoonView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }
                    .tag("coming-soon")
                
                DownloadsView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }
                    .tag("downloads")
                
                Text("More")
                    .tabItem {
                        Image(systemName: "equal")
                        Text("More")
                    }
                    .tag("more")
            }
            .accentColor(.white)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            
            PreviewList(movies: previewMovies, currentSelection: $previewStartingIndex, isVisible: $showPreviewFullScreen)
                .offset(y: previewCurrentPos)   // useful for user drag gesture
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { showPreview in
            if showPreview {
                withAnimation {
                    previewCurrentPos = .zero
                }
            } else {
                withAnimation {
                    previewCurrentPos = screen.height + 20
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
