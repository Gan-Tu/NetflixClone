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
            .offset(x: -geo.size.width * CGFloat(controller.currentPreviewMovieIndex))
            .offset(x: controller.translation_x)
            .animation(.interactiveSpring())
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        if ((controller.currentPreviewMovieIndex == 0 && value.translation.width > 0) ||
                            (controller.currentPreviewMovieIndex == pageCount - 1 && value.translation.width < 0)) {
                            // do nothing
                        } else {
                            controller.translation_x = value.translation.width
                        }
                    })
                    .onEnded({ value in
                        let offset = value.translation.width / geo.size.width
                        let newIndex = (CGFloat(controller.currentPreviewMovieIndex) - offset).rounded()
                        controller.currentPreviewMovieIndex = min(max(Int(newIndex), 0), pageCount-1)
                        controller.translation_x = .zero
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

