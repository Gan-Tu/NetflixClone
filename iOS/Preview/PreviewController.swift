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
    
    enum SwipeDirection {
        case UNSET
        case VERTICAL
        case HORIZONTAL
    }
    var swipe_direction: SwipeDirection = .UNSET
    
    public func startDrag() {
        if swipe_direction == .UNSET {
            if abs(drag_transition_x) > abs(drag_transition_y) {
                swipe_direction = .HORIZONTAL
            } else {
                swipe_direction = .VERTICAL
            }
        }
    }
    
    public func endDrag(screenSize: CGSize) {
        swipe_direction = .UNSET
        if drag_transition_y >= screenSize.height {
            showPreviewFullScreen = false
        }
    }
    
    public func nextPage(pageCount: Int) {
        if currentPreviewMovieIndex < pageCount - 1 {
            currentPreviewMovieIndex += 1
        }
    }
    
    public func prevPage() {
        if currentPreviewMovieIndex > 0 {
            currentPreviewMovieIndex -= 1
        }
    }
    
    public func transitionPreview(endXCoordinate: CGFloat, screenSize: CGSize, pageCount: Int) -> Void {
        if (drag_transition_x == 0 && drag_transition_y == 0) {
            if (endXCoordinate < screenSize.width / 2) {
                // left tap gesture
                prevPage()
            } else {
                nextPage(pageCount: pageCount)
            }
            return
        }
        
        let dragOffsetXPercent = drag_transition_x / screenSize.width
        let newIndex = (CGFloat(currentPreviewMovieIndex) - dragOffsetXPercent).rounded()
        currentPreviewMovieIndex = min(max(Int(newIndex), 0), pageCount-1)
        drag_transition_x = 0.0
        let dragOffsetYPercent = drag_transition_y / screenSize.height
        if (dragOffsetYPercent > 0.5) {
            showPreviewFullScreen = false   // hide view
        }
        drag_transition_y = 0.0     // reset position
    }
    
    public func getOffsetX(screenSize: CGSize, pageCount: Int) -> Double {
        let pageOffset = -screenSize.width * CGFloat(currentPreviewMovieIndex);
        if (swipe_direction == .VERTICAL) {
            return pageOffset
        }
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
    
    public func getOffsetY(screenSize: CGSize, pageCount: Int) -> Double {
        if (swipe_direction == .HORIZONTAL) {
            return 0
        }
        return max(drag_transition_y, 0)    // no swipe up
    }
}
