//
//  FilmEntryCodable.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/13/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

struct FilmEntryCodable: Codable {
    var firstActor: String
    var locations: String
    var releaseYear: MultiType
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case firstActor = "actor_1"
        case locations = "locations"
        case releaseYear = "release_year"
        case title = "title"
    }
}

extension FilmEntryCodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstActor = (try container.decodeIfPresent(String.self, forKey: .firstActor)) ?? "Unknown Actor"
        locations = (try container.decodeIfPresent(String.self, forKey: .locations)) ?? "Unknown Location"
//        releaseYear = (try container.decodeIfPresent(String.self, forKey: .releaseYear)) ?? "Unknown Year"
        releaseYear = (try container.decodeIfPresent(MultiType.self, forKey: .releaseYear)) ?? MultiType.string("Unknown year") //decode if it's string or int
        title = (try container.decodeIfPresent(String.self, forKey: .title)) ?? "Unknown Title"
    }
}
