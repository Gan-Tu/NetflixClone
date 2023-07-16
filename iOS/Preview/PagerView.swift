//
//  PagerView.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import SwiftUI

struct PagerView<Content: View>: View {
    @EnvironmentObject var controller: PreviewController
    
    let pageCount: Int
    let content: Content
    
    init (
        pageCount: Int,
        @ViewBuilder content: () -> Content) {
            self.pageCount = pageCount
            self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                self.content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: controller.getOffsetX(sizeOfOneScreen: geo.size.width,
                                             pageCount: pageCount))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        controller.drag_transition_x = value.translation.width
                        controller.drag_transition_y = value.translation.height
                    })
                    .onEnded({ value in
                        controller.drag_transition_x = value.translation.width
                        controller.drag_transition_y = value.translation.height
                        controller.transitionPreview(
                            sizeOfOneScreen: geo.size.width, pageCount: pageCount)
                    })
            )
        }
        .edgesIgnoringSafeArea(.all)
//        .offset(y: 100)
    }
}

struct PagerViewDummy: View {
    private var controller = PreviewController()
    
    var body: some View {
        PagerView(pageCount: 3) {
            Color.red
            Color.blue
            Color.black
        }
        .environmentObject(controller)
    }
}

#Preview {
    PagerViewDummy()
}

