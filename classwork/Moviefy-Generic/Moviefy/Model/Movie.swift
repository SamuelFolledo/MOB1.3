//
//  Movie.swift
//  Moviefy
//
//  Created by Adriana González Martínez on 4/7/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct Movie: ModelProtocol {
    let id: Int
    let title: String
    let posterPath: String? //must be optional
    let releaseDate: String
}

extension Movie: Hashable {}
