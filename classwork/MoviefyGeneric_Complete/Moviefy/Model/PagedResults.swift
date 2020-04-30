//
//  PagedResult.swift
//  Moviefy
//
//  Created by Adriana González Martínez on 4/28/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct PagedResults<T: Model>: Model {
    let page: Int
    let totalPages: Int
    let results: [T]
}

extension PagedResults {
    static var decoder: JSONDecoder { T.decoder }
}

