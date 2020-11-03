//
//  MovieListView.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import SwiftUI

struct MovieListView: View {
    private let object: Movie

    init(object: Movie) {
        self.object = object
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(object.title)
            }
        }
    }
}

//struct MovieListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieListView()
//    }
//}
