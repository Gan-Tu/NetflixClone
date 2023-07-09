//
//  NotificationBar.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import SwiftUI

struct NotificationBar: View {
    @Binding var showNotificationList: Bool

    var body: some View {
        Button(action: {
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                Text("Notifications").bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
        })
        .foregroundColor(.white)
        .padding()
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            NotificationBar(showNotificationList: .constant(false))
        }
    }
}
