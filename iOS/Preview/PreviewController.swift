//
//  PreviewController.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import Foundation
import SwiftUI

class PreviewController : ObservableObject {
    @Published var currentPreviewMovieIndex: Int = .zero
    @Published var showPreviewFullScreen: Bool = false
    
    public func shouldPlayVideo(index: Int) -> Bool {
        return showPreviewFullScreen && (currentPreviewMovieIndex == index)
    }
    
    @Published var drag_transition_x: CGFloat = .zero
    @Published var drag_transition_y: CGFloat = .zero
    
    public func getOffsetX(sizeOfOneScreen screenSize: Double, pageCount: Int) -> Double {
        let pageOffset = -screenSize * CGFloat(currentPreviewMovieIndex);
        var dragOffset = drag_transition_x
        if (currentPreviewMovieIndex == 0 && drag_transition_x > 0) {
            // swipe right has no effect on left most screen
            dragOffset = 0.0
        } else if (currentPreviewMovieIndex == pageCount - 1 && drag_transition_x < 0) {
            // swipe left has no effect on right most screen
            dragOffset = 0.0
        }
        return pageOffset + dragOffset
    }
    
    public func transitionPreview(sizeOfOneScreen screenSize: Double, pageCount: Int) -> Void {
        let dragOffsetPercent = drag_transition_x / screenSize
        let newIndex = (CGFloat(currentPreviewMovieIndex) - dragOffsetPercent).rounded()
        currentPreviewMovieIndex = min(max(Int(newIndex), 0), pageCount-1)
        drag_transition_x = 0.0
    }
}
