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
            .offset(x: controller.getOffsetX(screenSize: geo.size,
                                             pageCount: pageCount),
                    y: controller.getOffsetY(screenSize: geo.size,
                                             pageCount: pageCount))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        controller.drag_transition_x = value.translation.width
                        controller.drag_transition_y = value.translation.height
                        controller.startDrag()
                    })
                    .onEnded({ value in
                        controller.drag_transition_x = value.translation.width
                        controller.drag_transition_y = value.translation.height
                        controller.transitionPreview(
                            endXCoordinate: value.location.x,
                            screenSize: geo.size,
                            pageCount: pageCount)
                        controller.endDrag(screenSize: geo.size)
                    })
            )
        }
        .edgesIgnoringSafeArea(.all)
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

struct PagerViewDummy_Previews: PreviewProvider {
    static var previews: some View {
        PagerViewDummy()
    }
}

