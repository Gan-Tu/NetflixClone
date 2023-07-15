//
//  SmallVerticalButton.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var color: Color = Color.white
    
    var isOn: Bool
    
    var imageName : String {
        return isOn ? isOnImage : isOffImage
    }
    
    var onButtonClick: () -> Void
    
    var body: some View {
        Button(action: onButtonClick, label: {
            VStack {
                Image(systemName: imageName)

                Text(text)
                    .font(.system(size: 14))
                    .bold()
            }
            .foregroundColor(color)
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            SmallVerticalButton(text: "My List",
                                isOnImage: "checkmark",
                                isOffImage: "plus",
                                isOn: false) {
                print("Tapped")
            }
        }
    }
}
