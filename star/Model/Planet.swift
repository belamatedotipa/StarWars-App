//
//  Planet.swift
//  star
//
//  Created by Bela Mate Barandi on 5/21/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation

struct PlanetParent: Decodable {
    var results: [Planet]
}

struct Planet: Decodable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String] = []
    let films: [String] = []
    let created: String
    let edited: String
    let url: String
    
}
