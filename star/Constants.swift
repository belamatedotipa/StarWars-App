//
//  Constants.swift
//  star
//
//  Created by Bela Mate Barandi on 5/18/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


//MARK: - URLS
let BASE_URL = "https://swapi.co/api/"
let URL_PEOPLE = "\(BASE_URL)people"
let URL_PLANET = "\(BASE_URL)planets"
let URL_VEHICLE = "\(BASE_URL)vehicles"
let URL_FILM = "\(BASE_URL)films"

//MARK: - ASSETS
let FAV_EMPTY = "star_empty"
let FAV_FILLED = "star_full"

//MARK: - CELLS
let STAR_CELL = "starCell"
let DETAIL_CELL = "detailCell"

//MARK: - SEQUES
let DETAIL_VC = "DetailVC"


//HEADER
let HEADER = [
    "Content-Type": "application/json"
]
