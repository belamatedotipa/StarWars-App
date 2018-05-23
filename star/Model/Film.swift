//
//  Film.swift
//  star
//
//  Created by Bela Mate Barandi on 5/21/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation

struct FilmParent: Decodable {
    var results: [Film]
}

struct Film: Decodable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: [String]?
    let planets: [String]?
    let starships: [String]?
    let vehicles: [String]?
    let species: [String]?
    let created: String
    let edited: String
    let url: String
    
}



    

