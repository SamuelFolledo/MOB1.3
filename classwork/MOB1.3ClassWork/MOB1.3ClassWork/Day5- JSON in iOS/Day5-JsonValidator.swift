//
//  Day5-JsonValidator.swift
//  MOB1.3ClassWork
//
//  Created by Macbook Pro 15 on 4/13/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import Foundation

//Create a JSON using these data structures
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
