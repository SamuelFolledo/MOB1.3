//
//  Car.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/27/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

class Car {
    
    var miles = 0
    var type: CarType
    var transmissionMode: CarTransmissionMode
    
    init(type:CarType, transmissionMode:CarTransmissionMode){
        self.type = type
        self.transmissionMode = transmissionMode
    }
    
    func start(minutes: Int) {
        
        var speed = 0
        
        if self.type == .Economy && self.transmissionMode == .Drive {
            speed = 35
        }
        
        if self.type == .OffRoad && self.transmissionMode == .Drive {
            speed = 50
        }
        
        if self.type == .Sport && self.transmissionMode == .Drive {
            speed = 70
        }
        
        self.miles = speed * (minutes / 60)
        
    }
    
}

enum CarType {
    case Economy
    case OffRoad
    case Sport
}

enum CarTransmissionMode {
    case Park
    case Reverse
    case Neutral
    case Drive
}

///get the number of vowels in a string
func vowelsInAString(string: String) -> Int {
    let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
//    var numberOfVowels = 0
//    for character in string {
//        if vowels.contains(character) {
//            numberOfVowels +=  1
//        }
//    }
//    return numberOfVowels
    
    //MARK: Higher order function - Reduce
    return Array(string).reduce(0) { return vowels.contains($1) ? $0 + 1 : $0 } //if each character in string is in vowels, then increment $0 by 1
}

//Function that given a string, it formats it to have each letter capitalized to become a title
func makeTitle(string: String) -> String {
    let words = string.components(separatedBy: " ")
//    var headline = ""
//    for var word in words {
//        let firstCharacter = word.remove(at:word.startIndex)
//        headline += "\(String(firstCharacter).uppercased())\(word) "
//    }
//
//    headline.remove(at:headline.endIndex)
//    return String(headline.dropLast())
    
    //MARK: Higher Order Function - Map
    return (words.map { $0.capitalized }).joined()
}
//makeTitle(string: "my title") //will return MyTitle
