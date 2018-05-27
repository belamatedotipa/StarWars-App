//
//  DataService.swift
//  star
//
//  Created by Bela Mate Barandi on 5/18/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    
    //MARK: - Properties
    
    var star : [Star] = []

    //proba
    var nameArray : [Star] = []
    var birthArray : [Star] = []
    //var starDict_proba: [IntSortKey: [Star]] = [:]
    
    
    
    //MARK: - Functions
    func findAllPeopleWithPassing(completion: @escaping CompletionHandlerForPeople) {
        
        Alamofire.request(URL_PEOPLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
//                print(response)
                guard let data = response.data else { return }
                
                do {
                    
                    let json = try JSONDecoder().decode(StarParent.self, from: data)
                    let starWarsPeopleDataArray = json.results
                    completion(starWarsPeopleDataArray)
                
                } catch let error {
                    debugPrint(error as Any)
                }

            } else {
                completion(nil)
                debugPrint(response.result.error as Any)
            }
            
        }
        
        
        
    }
    
    

    
    
    
}


