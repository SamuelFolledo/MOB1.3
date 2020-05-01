//
//  Model.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 4/29/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

//common protocol that all of our response models can implement
public protocol ModelProtocol: Codable {
    static var decoder: JSONDecoder { get }
    static var encoder: JSONEncoder { get }
}

public extension ModelProtocol {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase //must convert snake case to Swift's camel case
        return decoder
    }

    static var encoder: JSONEncoder { //convert camelcase to snake case
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
}
