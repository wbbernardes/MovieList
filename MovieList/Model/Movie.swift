//
//  Movie.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation

struct MovieList: Codable {
    var page: Int
    var total_results: Int
    var total_pages: Int
    var results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int
    var title: String
    var vote_average: Double
    var poster_path: String
    var backdrop_path: String
    
    private enum CodingKeys: String, CodingKey {
        case id =               "id"
        case title =            "title"
        case vote_average =     "vote_average"
        case poster_path =      "poster_path"
        case backdrop_path =    "backdrop_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average) ?? 0.0
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path) ?? ""
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path) ?? ""
    }
    
}
