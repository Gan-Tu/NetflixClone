//
//  CustomTabSwitcher.swift
//  NetflixClone
//
//  Created by Gan Tu on 7/17/21.
//

import SwiftUI

struct CustomTabSwitcher: View {
    var body: some View {
        VStack {
            // Scrollable, Custom Tab picker
            ScrollView(.horizontal, showsIndicators: false) {
                Text("TEST")
            }
            
            // Selected View
            Text("SELECTED VIEW")
        }
        .foregroundColor(.white)
    }
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            CustomTabSwitcher()
        }
    }
}
