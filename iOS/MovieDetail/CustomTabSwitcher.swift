//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by Gan Tu on 7/17/21.
//

import SwiftUI

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .episodes
    
    var tabs: [CustomTab]
    var movie: Movie
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        let value = tab.rawValue
        return value.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    
    var body: some View {
        VStack {
            // Scrollable, Custom Tab picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        VStack {
                            // Red bar
                            Rectangle()
                                .frame(width: widthForTab(tab), height: 6)
                                .foregroundColor(tab == currentTab ? Color.red : Color.clear)
                            
                            // Button
                            Button(action: {
                                currentTab = tab
                                
                            }, label: {
                                Text(tab.rawValue)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(tab == currentTab ? Color.white : Color.gray)
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab), height: 30)
                        }
                    }
                }
            }
            
            // Selected View
            switch currentTab {
            case .episodes:
                SmallVerticalButton(text: currentTab.rawValue, isOnImage: "", isOffImage: "", isOn: false) {
                    // todo
                }
            case .trailers:
                SmallVerticalButton(text: currentTab.rawValue, isOnImage: "", isOffImage: "", isOn: true) {
                    // TODO
                }
            case .more:
                MoreLikeThis(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}

enum CustomTab: String {
    case episodes = "EPISODES"
    case trailers = "TRAILERS & MORE"
    case more = "MORE LIKE THIS"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            CustomTabSwitcher(tabs: [.episodes, .trailers, .more], movie: anotherLifeMovie)
        }
    }
}
