//
//  SearchBar.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/3/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isLoading: Bool

    @State private var isEditing = true
    
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
                        .padding(7)
                        .padding(.leading, -7)
                        .background(Color.graySearchBackground)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isEditing = true
                        }
                    
                    if !text.isEmpty {
                        if isLoading {
                            Button(action: {
                                // text = ""
                            }, label: {
                                ActivityIndicator(style: .medium, animate: .constant(true))
                                    .configure {
                                        $0.color = .white
                                    }
                            })
                            .padding(.trailing, 10)
                            .frame(width: 35, height: 35)
                            
                        } else {
                            Button(action: {
                                 text = ""
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.graySearchText)
                                    .frame(width: 35, height: 35)
                            })
                            .padding(.trailing, 10)
                        }
                    }
                    
                }
            }
            .animation(.default)
            
            if isEditing{
                Button(action: {
                    // clear text, hide both buttons, give up first-responder
                    text = ""
                    isEditing = false
                    isLoading = false
                    hideKeyboard()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                })
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}
