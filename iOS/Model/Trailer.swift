//
//  Trailer.swift
//  NetflixClone
//
//  Created by Gan Tu on 8/1/21.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoUrl: URL
    var thumbnailImageURL: URL
}
