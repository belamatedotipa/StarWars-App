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
//    var favorited: Bool?
    
//    init(name: String
//     height: String
//    , mass: String
//    , hair_color: String
//    , skin_color: String
//    , eye_color: String
//    , birth_year: String
//    , gender: String
//    , homeworld: String
//    , films: [String]?
//    , species: [String]?
//    , vehicles: [String]?
//    , starships: [String]?
//    , created: String
//    , edited: String
//    , url: String
//    ,favorited: Bool?
//)
    mutating func changeFavorited(){
        favorited = false
    }
    }



