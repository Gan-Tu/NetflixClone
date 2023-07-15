//
//  PreviewController.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/15/23.
//

import Foundation
import SwiftUI

class PreviewController : ObservableObject {
    @Published var translation_x: CGFloat = .zero
    @Published var translation_y: CGFloat = .zero
    @Published var currentPreviewMovieIndex: Int = .zero
    @Published var showPreviewFullScreen: Bool = false
    
    public func shouldPlayVideo(index: Int) -> Bool {
        return showPreviewFullScreen && (currentPreviewMovieIndex == index)
    }
}
