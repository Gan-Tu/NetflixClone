//
//  SearchBar.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/3/23.
//

import SwiftUI

struct SearchBar: View {
    @State private var text:String = ""
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                Color.graySearchBackground
                    .frame(height: 36)
                    .cornerRadius(8)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.graySearchText)
                        .padding(.leading, 10)
                    
                    TextField("Search", text: $text)
                        .padding(.leading, -7)
                        .background(Color.graySearchBackground)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .padding(3)
                    
                    Button(action: {
                        // clear text
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.graySearchText)
                            .frame(width: 35, height: 35)
                    })
                    .padding(.trailing, 10)
                    
                }
            }
            
            
            Button(action: {
                // clear text, hide both buttons, give up first-responder
            }, label: {
                Text("Cancel")
                    .foregroundColor(.white)
            })
            .padding(.trailing, 10)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            SearchBar()
                .padding()
        }
    }
}
