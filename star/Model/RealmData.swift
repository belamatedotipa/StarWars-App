//
//  RealmData.swift
//  star
//
//  Created by Bela Mate Barandi on 5/22/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var height: String = ""
    @objc dynamic var mass: String = ""
    @objc dynamic var hair_color: String = ""
    @objc dynamic var skin_color: String = ""
    @objc dynamic var eye_color: String = ""
    @objc dynamic var birth_year: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var homeworld: String = ""
    @objc dynamic var films: [String] = []
    @objc dynamic var species: [String] = []
    @objc dynamic var vehicles: [String] = []
    @objc dynamic var starships: [String] = []
    @objc dynamic var created: String = ""
    @objc dynamic var edited: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var favorited: Bool = false
}
