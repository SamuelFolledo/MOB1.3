//
//  Day5-JsonValidator.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/13/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

// MARK: Codable example
struct Location: Codable {
    var name: String
    var distance: Double
}

struct Park: Codable{
    var name: String
    var location: Location
}

let parks:[Park] = [Park(name: "Universal Studios", location: Location(name: "Florida", distance: 100.0)), Park(name: "Disneyland", location: Location(name: "California", distance: 200.0)), Park(name: "Cedar Point", location: Location(name: "Ohio", distance: 300.0))
]

//Encoding
func encode() {
    do {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(parks)
        let jsonString = String(decoding: jsonData, as: UTF8.self)
        print(jsonString)
    } catch {
        print(error.localizedDescription)
    }
}

//Decoding
func decode() {
    do {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(parks)
        
        let decoder = JSONDecoder()
        let decoded = try decoder.decode([Park].self, from: jsonData)
        
        for park in decoded{
            print(park.name)
        }
        
    } catch {
        print(error.localizedDescription)
    }
}


//MARK: In Class Activity 1: Create a JSON using these data structures
struct Participant{
    let name: String
    let id: String
}

struct City{
    let name: String
    let id: String
}

enum FestivalType{
    case music
    case food
    case cinema
}

struct Festival{
    let date: Date
    let name: String
    let city: City
    let lineup: [Participant]
    let type: FestivalType
}

/*

 {
     "festival": [
        {
            "date": "",
            "name": "",
            "city": {
                "name": "",
                "id": ""
            },
            "lineup": [
                {
                    "name": "",
                    "id": ""
                },
                {
                    "name": "",
                    "id": ""
                }
            ],
            "type": ""
        },
        {
            "date": "",
            "name": "",
            "city": {
                "name": "",
                "id": ""
            },
            "lineup": [
                {
                    "name": "",
                    "id": ""
                }
            ],
            "type": ""
        },
        {
            "date": "",
            "name": "",
            "city": {
                "name": "",
                "id": ""
            },
            "lineup": [
                {
                    "name": "",
                    "id": ""
                }
            ],
            "type": ""
        }
     ]
 }
 
*/
