//
//  ContentViewModel.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var movieList: [Movie] = []
    
    private var disposables = Set<AnyCancellable>()
    private var movieService = MovieService()
    
    func getMovies() {
        movieService.fetchMovies()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.movieList = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] object in
                self?.movieList = object.results
            }
            .store(in: &disposables)
    }
}


//class BaseViewModel: ObservableObject {
//
//}
//
//class ContentViewModel: ObservableObject {
//    @Published var value = ""
//}
//
//struct ContentTestView: View {
//
//    @ObservedObject var viewModel = ContentViewModel()
//
//    var body: some View {
//        VStack {
//            Text(viewModel.value)
//            Button("change value") {
//                self.viewModel.value = "\(Int.random(in: 1...10))"
//            }
//        }
//
//    }
//}
