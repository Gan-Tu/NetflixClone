//
//  Movie.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import Foundation

struct Movie : Identifiable {
    var id: String
    var name: String
    var thumbnailURL: URL
    
    var categories: [String]
    
    // MovieDetail View
    var year: Int
    var rating: String
    var numberOfSeasons: Int?   // could be a movie that has no seasons
    
    var epsidoes: [Epsidoe]?
    
    var promotionHeadline: String?
    
    var numberOfSeasonsDisplay : String {
        if let num = numberOfSeasons {
            if num == 1 {
                return "1 Season"
            } else {
                return "\(num) Seasons"
            }
        }
        return ""
    }
}
