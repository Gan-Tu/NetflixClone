//
//  PlayButton.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import SwiftUI

struct PlayButton: View {
    var text: String
    var imageName: String
    var backgroundColor: Color = Color.white
    
    var onClick: () -> Void
    
    var body: some View {
        Button(action: onClick, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                Spacer()
            }
            .padding(.vertical, 6)
            .background(backgroundColor)
            .foregroundColor(backgroundColor == .white ? .black : .white)
            .cornerRadius(3.0)
        })
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            PlayButton(text: "Play", imageName: "play.fill") {
                // action
            }
        }
    }
}
