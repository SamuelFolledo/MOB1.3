//
//  Route.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 5/4/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

public enum Route: String{
    case discoverMovie =  "discover/movie"
    case upcomingMovie = "movie/upcoming"
    case token = "authentication/token/new"
    case session = "authentication/session/new"
    case account = "account"
}
