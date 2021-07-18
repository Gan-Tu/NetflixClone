//
//  Episode.swift
//  NetflixClone
//
//  Created by Gan Tu on 7/17/21.
//

import Foundation

struct Epsidoe: Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var season: Int
    var thumbnailImageURLString: String
    var description: String
    var length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!    // force unwrap for now
    }
}
