//
//  Bundle+Extension.swift
//  MovieList
//
//  Created by Wesley Brito on 01/11/20.
//

import Foundation

extension Bundle {
    var apiKey: String {
        if let path = Bundle.main.path(forResource: "apikey", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path) as? [String: String] {
            return dict["apikey"] ?? ""
        }
        return ""
    }

    static func loadJSONFromBundle(bundle: Bundle = Bundle.main, resourceName: String) -> Data {
        guard let url = bundle.url(forResource: resourceName, withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return Data()
        }
        return data
    }
}
