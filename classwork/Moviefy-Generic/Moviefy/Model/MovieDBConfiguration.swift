//
//  MovieDBConfiguration.swift
//  Moviefy
//
//  Created by Macbook Pro 15 on 4/30/20.
//  Copyright © 2020 Adriana González Martínez. All rights reserved.
//

import Foundation

//MARK: Stretch Challenge: https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson9/assignments/moviefy-base.md
//Configuration endpoint. More info at https://developers.themoviedb.org/3/configuration/get-api-configuration
struct MovieDBConfiguration: ModelProtocol {
    
    struct Images : ModelProtocol {
        let baseUrl: URL
        let secureBaseUrl: URL
        let backdropSizes: [String]
        let logoSizes: [String]
        let posterSizes: [String]
        let profileSizes: [String]
        let stillSizes: [String]
    }

    let images: Images
    static var current: MovieDBConfiguration?
}

//extension MovieDBConfiguration: Hashable {}
