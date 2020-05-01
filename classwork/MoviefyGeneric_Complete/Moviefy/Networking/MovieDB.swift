//
//  MovieDB.swift
//  Moviefy
//
//  Created by Adriana González Martínez on 4/28/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct MovieDB { // logic specific to the TMDB API
    public static let baseImageURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    public static let baseURL = URL(string: "https://api.themoviedb.org/3/")!
    public static var api: APIClient = {
        let configuration = URLSessionConfiguration.default
        let apiKey = PrivateKey.readMovieKey
        configuration.httpAdditionalHeaders = [
            "Authorization": "Bearer \(apiKey)"
        ]
        return APIClient(configuration: configuration)
    }()
}

