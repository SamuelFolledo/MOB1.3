//
//  Closures.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/5/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

struct Guest: CustomDebugStringConvertible, Equatable {
    var name: String
    var age: Int
    
    var debugDescription: String {
        return name
    }
}

class ClosurePlayground {
    let paola = Guest(name: "Paola", age: 24)
    let sven = Guest(name: "Sven", age: 23)
    let shuyi = Guest(name: "Shuyi", age: 17)
    let charlie = Guest(name: "Charlie", age: 18)
    var guestList: [Guest]
    init() {
        guestList = [paola, sven, shuyi, charlie]
    }
    
    ///Sort - sorts a collection and returns a collection sorted in ascending by default
    ///◦ elements in the array need to conform to the Comparable protocol.
    fileprivate func sortExamples() {
        //SORT these numbers
        let numbersToSort = [2, 4, 4, 2, 1, 0]
        print("Sorted numbers: ", numbersToSort.sorted()) //ascending by default
        print("Sorted numbers: ", numbersToSort.sorted(by: >)) //descending
        //SORT the guests by name
        let guestsToSort = guestList
        print("Sorted by name: ", guestsToSort.sorted(){ $0.name < $1.name })
        //SORT the guests by age, but in descending order (youngest at the front of the array)
        print("Sorted by age: ", guestsToSort.sorted(){ $0.age < $1.age }) //sort by age ascending (youngest first)
    }
    
    ///Filter - the filter method will return an array that has only elements that pass your filter specified in your closure.
    fileprivate func filterExamples() {
        let guestToFilter = guestList
        //FILTER the guests to only include guests younger than 18 years
        print("Minors: ", guestToFilter.filter{ $0.age < 18 }) //creates an array of guest from guests with age less than 18
        //FILTER the numbers to only include even numbers
        let numbersToFilter = [2, 1, 1, 5, 6, 7, 10]
        print("Even numbers: ", numbersToFilter.filter{ $0 % 2 == 0 }) //filter numbers to only have even numbers
    }
    
    ///Map - iterates through the array and changes each element of the array based on the closure passed to the method
    fileprivate func mapExamples() {
        let lowerCaseLetters = ["a", "z", "b", "x", "c", "y"]
        print("Upper Cased Letters: ", lowerCaseLetters.map { (aLetter: String) -> String in
            let upperCaseOfLetter = aLetter.uppercased()
            return upperCaseOfLetter
        })
        print("Shorter upper Cased Letters: ", lowerCaseLetters.map { $0.uppercased() })
        //map the numbers to be double their values (e.g. 5 gets mapped to 10)
        let numbersToDouble = [2, 4, 6, 8]
        print("Doubled values: ", numbersToDouble.map { $0 * 2 }) //doubles each values in numbersToDouble array
        let numbersToMapIntoStrings = [2, 4, 5, 1, 2, 2]
        print("Int as String: ", numbersToMapIntoStrings.map { "\($0)" }) //map the numbersToMapIntoStrings into strings
    }
    
    ///Reduce - The reduce function allows you to combine all the elements in an array and return an object of any type
    fileprivate func reduceExamples() {
        //REDUCE the numbers into a sum, but exclude negative numbers from the sum. Thus, your reduce closure should reduce this array to equal 10
        let numbersToSum = [-2, -5, -4, 5, -5, 5]
        print("Sum of positives: ", numbersToSum.reduce(0) { (result, num) -> Int in //sum positive numbers in numbersToSum
            return num > 0 ? result + num : result //if num > 0, increment result, else just return result
        })
        print("Shorter sum of positives: ", numbersToSum.reduce(0) { return $1 > 0 ? $0 + $1 : $0 })
        //Chaining filter and reduce higher order functions
        print("Chained sum of positives: ", numbersToSum.filter{$0 > 0}.reduce(0, +))
    }
}
