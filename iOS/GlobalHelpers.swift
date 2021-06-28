//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import Foundation

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQS4aCgNaUeXAgsbXrmYZrTmQ7zQSqXd2aWrEbET_swLIlZltsL")!,
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
                          name: "After life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v6")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-fy TV"])

let exampleMovies: [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

