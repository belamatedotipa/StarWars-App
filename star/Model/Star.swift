//
//  Star.swift
//  InsulinApp
//
//  Created by Bela Mate Barandi on 5/18/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation

//proba
enum SegmentedKey {
    case name
    case birthYear
    case favorite
    }


struct StarParent: Decodable {
    var results: [Star]
    var count: Int?
    var next: String?
    var previous: String?
}

struct Star: Decodable{
  
    //public private(set) var
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]?
    let species: [String]?
    let vehicles: [String]?
    let starships: [String]?
    let created: String
    let edited: String
    let url: String
    }



