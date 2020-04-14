//
//  MultiType.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/13/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

/*
 Our structure has the property releaseYear as a String. But it could be the case that the server sends it back as Int, and because it's a mismatch in types, our app will fail to decode it.
 https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lesson6/assignments/Codable.md
*/

///Handles multiple data types in Codable. Used when values can either be strings or int
enum MultiType: Codable {

    func encode(to encoder: Encoder) throws {

    }

    case int(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self)  {
            self = .int(intValue)
            return
        }
        if let stringValue = try? decoder.singleValueContainer().decode(String.self){
            self = .string(stringValue)
            return
        }
        throw MultiType.missingValue
    }

    enum MultiType: Error {
        case missingValue
    }
}

extension MultiType {
    var value: String {
        switch self {
        case .int(let intvalue):
            return String(intvalue)
        case .string(let stringValue):
            return stringValue
        }
    }
}
