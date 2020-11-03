//
//  MovieService.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation
import Moya
import Combine
import CombineMoya

protocol  MovieServiceType {
    func fetchMovies() -> AnyPublisher<MovieList, MoyaError>
}

final class MovieService: BaseNetworkService<MovieProvider>, MovieServiceType {
    func fetchMovies() -> AnyPublisher<MovieList, MoyaError> {
        return provider
            .requestPublisher(.getMovies(page: 1))
            .filterSuccessfulStatusCodes()
            .map(MovieList.self)
            .eraseToAnyPublisher()
    }
}
