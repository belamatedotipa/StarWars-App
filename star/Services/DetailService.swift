//
//  DetailService.swift
//  star
//
//  Created by Bela Mate Barandi on 5/21/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation
import Alamofire

class DetailService {
    
    //MARK: - Properties
//static let instance = DetailService()
    
    
    var vehichle : [Vehicle] = []
    var film : [Film] = []
    var planet : [Planet] = []
    
    var filmDict: [[String:String]] = [[:]]
    
    
    enum filerKey: String {
        case vehicle = "vehicles"
        case film = "films"
        case homeworld = "planets"
        
    }

    
    func findAllVehicles(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_VEHICLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    let json = try JSONDecoder().decode(VehicleParent.self, from: data)
                    let vehicleArray = json.results
                    self.vehichle = vehicleArray
                } catch let error {
                    debugPrint(error as Any)
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    //Mark: - Functions returning an object for URL
    
    //Function returns a vehicle for URL
    func findVehicle(url: String, completion: @escaping (_ item: Vehicle?,_ error: Error?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                print(data)
                do {
                    let item = try JSONDecoder().decode(Vehicle.self, from: data)
                    completion(item, nil)
                } catch let error {
                    debugPrint(error as Any)
                }
                
           } else {
                guard let error = response.result.error else { return }
                debugPrint(error)
                completion(nil, error)
            }
        }
    }
    
    //Function returns a film for URL
    func findFilm(url: String, completion: @escaping (_ item: Film?,_ error: Error?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                print(data)
                do {
                    let item = try JSONDecoder().decode(Film.self, from: data)
                    completion(item, nil)
                } catch let error {
                    debugPrint(error as Any)
                }
                
            } else {
                guard let error = response.result.error else { return }
                debugPrint(error)
                completion(nil, error)
            }
        }
    }
    
    //Function returns a homeland for URL
    func findPlanet(url: String, completion: @escaping (_ item: Planet?,_ error: Error?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else { return }
                print(data)
                do {
                    let item = try JSONDecoder().decode(Planet.self, from: data)
                    completion(item, nil)
                } catch let error {
                    debugPrint(error as Any)
                }
                
            } else {
                guard let error = response.result.error else { return }
                debugPrint(error)
                completion(nil, error)
            }
        }
    }
    
    
    
 
    
    func findAllFilms(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_FILM, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    
                    let json = try JSONDecoder().decode(FilmParent.self, from: data)
                    let filmArray = json.results
                    
                    
                    
                    //Creating movie dict
                    self.filmDict = filmArray.map({ (film) -> [String:String] in
                        return [film.url:film.title]
                        
                    })
                    print(self.filmDict)
                    print()
                    
                    
                    self.film = filmArray
                    
                    print(self.film)
//                    let starNames = filmArray.map { $0.title }
//                    print(starNames)
                    //let filmTitles = filmArray.map({film[$0.title})
                    
                } catch let error {
                    debugPrint(error as Any)
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllPlanets(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_PLANET, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    let json = try JSONDecoder().decode(PlanetParent.self, from: data)
                    let planetArray = json.results
                    self.planet = planetArray
                } catch let error {
                    debugPrint(error as Any)
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    

    
//Filters an array of objects based on object type, filer array, target object
//    func filterForStar(<#parameters#>) -> <#return type#> {
//        <#function body#>
//    }
    
    
    
//        Alamofire.request(requestUrl).responseJSON{ response in
//            switch response.result{
//            case .success(let json):
//                //print(json)
//
//                var item: Vehicle?
//
//                if let dict = json as? [String: Any]{
//                    item = Vehicle(json: dict)
//                    item!.addVehicleProperties(json: dict)
//                }
//                callback(item)
//
//            case .failure(let error):
//                print(error)
//                callback(nil)
//            }
//        }
//    }
    
    
}
