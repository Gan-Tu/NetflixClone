//
//  GenerateMovies.swift
//  NetflixClone (iOS)
//
//  Created by Gan Tu on 7/9/23.
//

import Foundation
import LoremSwiftum


func generateMovies(_ count: Int) -> [Movie] {
    guard count > 0 else { return [] }
    
    var allMovies: [Movie] = []
    
    for _ in 0..<count {
        let id = UUID().uuidString
        
        let name = Lorem.title
        
        let randThumbnail = Int.random(in: 0...40)
//        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        let thumbnail = URL(string: "https://picsum.photos/id/\(randThumbnail*2)/300/200")!
        
        let year = Int.random(in: 2000...2020)
        
        let cast = "Lorem ipsum, dolor sit"
        let creators = "felis non, libero consectetur"
        let categories = ["consectetur", "neque", "felis", "libero"]
        
        let headline = "Watch now!"
        
        let numSeasons = Int.random(in: 1...3)
        
        var allEpisodes: [Episode] = []
        
        for i in 1...numSeasons {
            allEpisodes.append(contentsOf: generateEpisodes(5, forSeason: i))
        }
        
        let epiname = Lorem.title
        
        let epidesc = Lorem.paragraph
        let defEpiInfo = CurrentEpisodeInfo(episodeName: epiname, description: epidesc, season: 1, episode: 1)
        
        let allTrailers = generateTrailers(3)
        
        let moreLikeThis = exampleMovies
        
        let movie = Movie(id: id, name: name, thumbnailURL: thumbnail, categories: categories, movieType: .movies, year: year, rating: "PG-13", numberOfSeasons: numSeasons, currentEpisode: defEpiInfo, defaultEpisodeInfo: defEpiInfo, creators: creators, casts: cast, moreLikeThisMovies: moreLikeThis, episodes: allEpisodes, promotionHeadline: headline, trailers: allTrailers)
        allMovies.append(movie)
    }
    
    return allMovies
}

func generateTrailers(_ count: Int) -> [Trailer] {
    var allTrailers: [Trailer] = []
    
    for _ in 0..<count {
        let name = Lorem.title
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = URL(string: "https://picsum.photos/300/10\(randThumbnail)")!
        
        let trailer = Trailer(name: name, videoUrl: exampleVideoURL, thumbnailImageURL: thumbnail)
        allTrailers.append(trailer)
    }
    
    return allTrailers
}

func generateEpisodes(_ count: Int, forSeason season: Int) -> [Episode] {
    var allEpisodes: [Episode] = []
    
    for num in 0..<count {
        let id = UUID().uuidString
        
        let name = Lorem.title
        
        let randThumbnail = Int.random(in: 0...9)
        let thumbnail = "https://picsum.photos/300/10\(randThumbnail)"
        
        let desc = Lorem.paragraph
        let randLength = Int.random(in: 20..<59)
        
        let episode = Episode(id: id, name: name, season: season, episodeNumber: num + 1, thumbnailImageURLString: thumbnail, description: desc, length: randLength, videoURL: exampleVideoURL)
        
        allEpisodes.append(episode)
    }
    
    return allEpisodes
}

