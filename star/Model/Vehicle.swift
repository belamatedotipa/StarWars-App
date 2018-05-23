//
//  Vehicle.swift
//  star
//
//  Created by Bela Mate Barandi on 5/21/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation

struct VehicleParent: Decodable {
    var results: [Vehicle]
}

struct Vehicle: Decodable {
    
    let name: String
    let model: String
    let manufacturer: String
    let cost_in_credits: String
    let length: String
    let max_atmosphering_speed: String
    let crew: String
    let passengers: String
    let cargo_capacity: String?
    let consumables: String?
    let vehicle_class: String?
    let pilots: [String] = []
    let films: [String] = []
    let created: String?
    let edited: String?
    let url: String?

}
