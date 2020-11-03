//
//  MovieProvider.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation
import Moya

enum MovieProvider {
    case getMovies(page: Int)
    case getMoviesDetail(movieId: Int)
    case getMoviesTrailer(movieId: Int)
}

extension MovieProvider: TargetType {
    var baseURL: URL {
        if let baseUrl = URL(string: "https://api.themoviedb.org/3") {
            return baseUrl
        }
        return URL(fileURLWithPath: "")
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/movie/now_playing"
        case .getMoviesDetail(movieId: let movieId):
            return "/movie/\(movieId)"
        case .getMoviesTrailer(movieId: let movieId):
            return "/movie/\(movieId)/videos"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .getMovies:
            return Bundle.loadJSONFromBundle(resourceName: "MovieMock")
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .getMovies(page: let page):
            let parameters = ["api_key": Bundle.main.apiKey,
                              "language": "pt-BR",
                              "page": "\(page)"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        case .getMoviesDetail, .getMoviesTrailer:
            let parameters = ["api_key": Bundle.main.apiKey,
                              "language": "pt-BR"]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
