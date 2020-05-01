//
//  ConfigurationResults.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 4/30/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

struct ConfigurationResults<T: ModelProtocol>: ModelProtocol {
    let changeKeys: [String]
    let images: T
}

extension ConfigurationResults {
    static var decoder: JSONDecoder { T.decoder }
}
