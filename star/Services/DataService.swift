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
    
    
    //MARK: - Service for finding all Star Wars characters on API
    func findAllStars(completion: @escaping CompletionHandlerForPeople){
        Alamofire.request(URL_PEOPLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                
                //Hold the returned items
                var starWarsPeopleDataArray: [Star] = []
                // Use a dispatch group to synchronize them all finishing
                let allPagesFetched = DispatchGroup()
                
                guard let data = response.data else { return }

                do {
                    let json = try JSONDecoder().decode(StarParent.self, from: data)
                    let items = json.results
                    starWarsPeopleDataArray.append(contentsOf: items)
                    guard let count = json.count else { return }
                    let pagesToFetch = count / SWAPI_ITEMS_PER_PAGE

                    ///Check for more pages
                    if(pagesToFetch > 0){
                        for page in 2...pagesToFetch + 1{
                            allPagesFetched.enter() //Enter the dispatch group
    
                            let url = "\(URL_PEOPLE)?page=\(page)"
                            
                            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
                                if response.result.error == nil {
                                    
                                    guard let data = response.data else { return }
                                    
                                    do {
                                        let json = try JSONDecoder().decode(StarParent.self, from: data)
                                        let Items = json.results

                                        starWarsPeopleDataArray.append(contentsOf: Items)
                                
                                    } catch let error {
                                        debugPrint(error as Any)
                                    }
                                    
                                } else {
                                    completion(nil)
                                    debugPrint(response.result.error as Any)
                                }
                            allPagesFetched.leave()
                        }
                    }

                        allPagesFetched.notify(queue: DispatchQueue.main) {
                            completion(starWarsPeopleDataArray.sorted{$0.name<$1.name})
                        }
                    }
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


