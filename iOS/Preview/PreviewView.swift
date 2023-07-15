//
//  PreviewView.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import SwiftUI

struct PreviewView: View {
    @ObservedObject var vm: PreviewViewModel
    
    var playVideo: Bool
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TrailerPlayerView(
                videoURL: vm.movie.trailers.first?.videoUrl,
                playVideo: .constant(playVideo))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text(vm.movie.name)
                            .bold()
                            .font(.largeTitle)
                    })
                    
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.top, 60)
                
                Spacer()
                
                
                HStack {
                    ForEach(0..<vm.movie.categories.count, id: \.self) { catIndex in
                        Text(vm.movie.categories[catIndex])
                            .font(.footnote)
                        
                        if catIndex != vm.movie.categories.count - 1 {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 3))
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", color: vm.accentColor, isOn: true) {
                        // todo
                    }
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("Play")
                                .textCase(.uppercase)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 26)
                        .border(vm.accentColor, width: 3)
                    })
                    
                    Spacer()
                    
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", color: vm.accentColor, isOn: true) {
                        // todo
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
            .padding(.bottom, 25)
            .foregroundColor(vm.accentColor)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PreviewView(vm: PreviewViewModel(movie: exampleMovie7), playVideo: true)
}
