//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import Foundation
import SwiftUI

let anotherLifeMovie = Movie(id: UUID().uuidString,
                             name: "Another Life",
                             thumbnailURL: URL(string: "https://static.wikia.nocookie.net/soundeffects/images/1/12/Another_Life_2019_TV_Series_Poster.jpg/revision/latest/scale-to-width-down/426?cb=20210112222440")!,
                             categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v1")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travelers",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v2")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v3")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])
let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Alone",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v4")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hanibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v5")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "The Crown",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v6")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}
