//
//  ComingSoon.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct ComingSoon: View {
    @State private var showNotificationList = false
    @State private var navBarHidden = true
    @State private var movieDetailToShow: Movie? = nil

    @ObservedObject var vm = ComingSoonViewModel()
    
    var body: some View {
        Group {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        NotificationBar(showNotificationList: $showNotificationList)
                        
                        ForEach(vm.movies, id: \.id) {movie in
                            ComingSoonRow(movie: movie, movieDetailToShow: $movieDetailToShow)
                                .frame(height: 400)
                        }
                    }
                }
                .foregroundColor(.white)
            }
            
            NavigationLink(
                destination: Text("Notification List"),
                isActive: $showNotificationList,
                label: {
                    EmptyView()
                })
            .navigationTitle("")
            .navigationBarHidden(navBarHidden)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: {_ in
                self.navBarHidden = true
            })
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: {_ in
                self.navBarHidden = false
            })
        }
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ComingSoon()
        }
    }
}
