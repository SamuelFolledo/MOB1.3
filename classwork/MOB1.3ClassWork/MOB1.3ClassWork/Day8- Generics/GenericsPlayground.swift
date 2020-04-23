//
//  GenericsPlayground.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/22/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

struct GenericsPlayground {
    //MARK: Generics Challenge
    //https://github.com/Make-School-Courses/MOB-1.3-Dynamic-iOS-Apps/blob/master/Lessons/Lab/assignments/generics.md

    //enum PetKind{
    //  case dog
    //  case cat
    //}
    //
    //struct KeeperKind {
    //  var keeperOf: PetKind
    //}
    //
    //let catKeeper = KeeperKind(keeperOf: .cat)
    //let dogKeeper = KeeperKind(keeperOf: .dog)

    class Cat {
        var name: String
        
        init(name: String) {
            self.name = name
        }
        
    }

    class Dog {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }

    class Keeper<Animal, AnotherAnimal> {
        var name: String
        var morningCare: Animal
        var afternoonCare: AnotherAnimal
        
        init(name: String, morningCare: Animal, afternoonCare: AnotherAnimal) {
            self.name = name
            self.morningCare = morningCare
            self.afternoonCare = afternoonCare
        }
    }

    let kim = Keeper(name: "Kim",
                     morningCare: Cat(name: "Arlo"),
                     afternoonCare: Cat(name: "Nova"))
    let kobe = Keeper(name: "Kobe", morningCare: Dog(name: "Doggie"), afternoonCare: Dog(name: "Doggie2"))
    let samuel = Keeper(name: "Samuel", morningCare: "Cattie", afternoonCare: "Doggie")

    let keep = Keeper(name: "Manager", morningCare: Dog(name: "Doggie"), afternoonCare: Cat(name: "Cathy"))


    //MARK: Using Generic, create a method that sums any type of numbers
//    protocol Numeric { //First, creating a new protocol that requires conforming types to be able to initialize themselves with an empty value (i.e. 0) and add instances of itself to itself:
//        init()
//        static func +(lhs: Self, rhs: Self) -> Self
//    }
//
//    extension Int: Numeric {} //make Int, Float, and Double conform to that protocol:
//    extension Float: Numeric {}
//    extension Double: Numeric {}
//
//    func sumArray<T: Numeric>(numbers: [T]) -> T { //Third, defining a function that accepts an array of numbers that conform to Numeric and returns a single value. //<T: Numeric> is required whenever you use generics as parameter
//        var total = T()
//
//        for num in numbers {
//            total = total + num
//        }
//
//        return total
//    }
//
//    print(sumArray(numbers: [1,2,4.5,9.00009,10.09, 1.1293192381923]))

    //MARK: Reimplementation of Contains
    func exist<T: Equatable>(item:T, inArray:[T]) -> Bool? { //must conform to Equatable protocol in order to compare
        for element in inArray {
            if item == element {
                return true
            }
        }
        return false
    }

    func find<T: Equatable>(item:T, inArray:[T]) -> Int? {
        for (index, element) in inArray.enumerated() {
            if element == item {
                return index
            }
        }
        return nil
    }

//    print(exist(item: "Kobe", inArray: ["MJ", "Lebron", "Kobe"]))
//    print(exist(item: 4, inArray: [1, 2, 4, 5]))
//
//    print(find(item: "Kobe", inArray: ["MJ", "Lebron", "Kobe"]))
//    print(find(item: 4, inArray: [1, 2, 4, 5]))

}
