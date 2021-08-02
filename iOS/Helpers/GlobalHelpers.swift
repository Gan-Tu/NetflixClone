//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Gan Tu on 6/27/21.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!

let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageUrl: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoUrl: exampleVideoURL, thumbnailImageURL: exampleImageURL)

let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoUrl: exampleVideoURL, thumbnailImageURL: exampleImageURL2)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoUrl: exampleVideoURL, thumbnailImageURL: exampleImageURL3)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]


let episode1 = Episode(name: "Beginnings and Endings", season: 1, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/102", description: "Six months after the disappearnce, the police form a task force. In 2052, Johnas learns that the most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)

let episode2 = Episode(name: "Dark Matter", season: 1, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/103", description: "Clausan and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old namesis.", length: 54, videoURL: exampleVideoURL)

let episode3 = Episode(name: "Ghosts", season: 1, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/104", description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brigns the time machien to Tannhaus, and Egon questions Ulrich again.", length: 56, videoURL: exampleVideoURL)

let episode4 = Episode(name: "Beginnings and Endings 2", season: 2, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/105", description: "Six months after the disappearnce, the police form a task force. In 2052, Johnas learns that the most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)

let episode5 = Episode(name: "Dark Matter 2", season: 2, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/106", description: "Clausan and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old namesis.", length: 54, videoURL: exampleVideoURL)

let episode6 = Episode(name: "Ghosts 2", season: 2, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/107", description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brigns the time machien to Tannhaus, and Egon questions Ulrich again.", length: 56, videoURL: exampleVideoURL)

let allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]


let anotherLifeMovie = Movie(id: UUID().uuidString,
                             name: "Another Life",
                             thumbnailURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMTNjOWNhYTQtNWEzOS00M2Q4LWEyOWMtZjU3ZjhhMTBmMWZjXkEyXkFqcGdeQXVyMjYwNDA2MDE@._V1_.jpg")!,
                             categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                             year: 2020,
                             rating: "TV-MA",
                             numberOfSeasons: 2,
                             defaultEpisodeInfo: exampleEpisodeInfo,
                             creators: "Baren bo Odan, Jantje Friese",
                             casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                             moreLikeThisMovies: exampleMovies, episodes: allExampleEpisodes, promotionHeadline: "New Season Coming Soon", trailers: exampleTrailers)

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v1")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 2,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "Baren bo Odan, Jantje Friese",
                          casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 2 Now", trailers: exampleTrailers)
let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "Travelers",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v2")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "Baren bo Odan, Jantje Friese",
                          casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 3 Now", trailers: exampleTrailers)
let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "Community",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v3")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 4,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "Baren bo Odan, Jantje Friese",
                          casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 4 Now", trailers: exampleTrailers)
let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "Alone",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v4")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "Baren bo Odan, Jantje Friese",
                          casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 5 Now", trailers: exampleTrailers)
let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "Hanibal",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v5")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 6,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "Baren bo Odan, Jantje Friese",
                          casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 6 Now", trailers: exampleTrailers)
let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "The Crown",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300?v6")!,
                          categories: ["Dystopian", "Exciting", "Suspensiful", "Sci-Fi"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeasons: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo,
                          creators: "Baren bo Odan, Jantje Friese",
                          casts: "Louis Hofmann, Oliver Mscucci, Jordi Tribel",
                          moreLikeThisMovies: [], promotionHeadline: "Watch Season 3 Now", trailers: exampleTrailers)

var exampleMovies: [Movie] {
    return [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]
}


let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Forsfe de Lorelace Faucibus", description: "Sed efficitur eget neque eu aliquam. Mauris lacinia ex orci, sit amet lobortis mi faucibus quis. Aliquam at semper sapien, in rhoncus nunc. Phasellus non sagittis velit. Sed convallis, arcu sed varius semper", season: 2, episode: 1)


let netflixGrayColor = Color(red: 177, green: 177, blue: 177)


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}


extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

