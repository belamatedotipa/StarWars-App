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
    

    
    //Mark: - Services returning an object for URL
    
    //Function returns a vehicle for URL
    func findVehicle(url: String, completion: @escaping (_ item: Vehicle?,_ error: Error?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                guard let data = response.data else { return }

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

    
    
}
