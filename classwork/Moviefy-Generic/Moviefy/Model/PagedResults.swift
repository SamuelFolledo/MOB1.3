//
//  PagedResults.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 4/29/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

//Here we are using a generic type PagedResults that has a generic parameter T. T is constrained to be an implementation of ModelProtocol, so we know it is decodable already.
struct PagedResults<T: ModelProtocol>: ModelProtocol {
    let page: Int
    let totalPages: Int
    let results: [T]
//    let dates: String //response for upcoming
}



extension PagedResults {
    static var decoder: JSONDecoder { T.decoder }
}
