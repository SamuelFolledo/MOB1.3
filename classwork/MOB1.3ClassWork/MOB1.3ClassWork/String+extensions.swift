//
//  Strings+extension.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/16/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

extension String {
    /// insert a string after a specified substring
    /// - Parameters:
    ///   - str: substring to insert
    ///   - substr: substring to insert str after
    /// - Returns: updated str if substr exist
    mutating func insert(str: String, after substr: String) -> String {
        if let range: Range<String.Index> = self.range(of: substr) {
            let index: Int = self.distance(from: self.startIndex, to: range.upperBound) //change to: range.lowerBound if you want to append at the beginning
            self.insert(contentsOf: str, at: self.index(self.startIndex, offsetBy: index))
            return self
        } else {
            print("substring not found")
        }
        return self
    }
}
