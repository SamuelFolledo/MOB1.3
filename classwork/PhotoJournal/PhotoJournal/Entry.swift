//
//  Entry.swift
//  PhotoJournal
//
//  Created by Macbook Pro 15 on 5/28/20.
//  Copyright © 2020 HazeStudio. All rights reserved.
//

import Foundation

struct Entry: Codable {
    let imagePath: String
    let textEntry: String
    let timeStamp: String
}
