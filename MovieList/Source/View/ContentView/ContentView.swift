//
//  ContentView.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.movieList) { object in
                Text(object.title)
            }
            .onAppear(perform: viewModel.getMovies)
            .navigationBarTitle("Movies")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
