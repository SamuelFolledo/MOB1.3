//
//  MovieDB.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 4/29/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct MovieDB { // logic specific to the TMDB API
    public static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    public static let baseURL = URL(string: "https://api.themoviedb.org/3/")!
    public static var api: APIClient = {
        let configuration = URLSessionConfiguration.default
        let apiKey = PrivateKey.readMovieKey.rawValue
        configuration.httpAdditionalHeaders = [
            "Authorization": "Bearer \(apiKey)"
        ]
        return APIClient(configuration: configuration)
    }()
}
