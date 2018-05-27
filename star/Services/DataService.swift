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
                print(response)
                guard let data = response.data else { return }
                
                do {
                    
                    let json = try JSONDecoder().decode(StarParent.self, from: data)
                    guard let count = json.count else { return }
                    guard let next = json.next else { return }
                    print(next)
                    print(count)
                    let starWarsPeopleDataArray = json.results
                    
                    //check if count is lower than swpda
//                    if count > starWarsPeopleDataArray.count {
//
//                    } else {
//                        completion(starWarsPeopleDataArray)
//                    }
                    //if yes new call
                    //parsing
                    //append new elements
                    print(starWarsPeopleDataArray)
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
    
//    func getAllStars2(completion: @escaping ([Star]) -> Void){
//
//
//        Alamofire.request(URL_PEOPLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
//            switch response.result{
//            case .success(let resonse):
//                //print(json)
//
//                //Begin the somewhat nasty Swift JSON parsing. When will they make this easier?
//                var items: [Star] = [] //Hold the items that will be returned
//
//                // Use a dispatch group to synchronize them all finishing
//                let allPagesFetched = DispatchGroup()
//
//                if let dict = response as? NSDictionary{
//                    guard let data = dict.data else { return }
//                    let count = dict["count"] as! Int
//                    let pagesToFetch = count / SWAPI_ITEMS_PER_PAGE
//
//                    //Go get the other pages if any
//                    if(pagesToFetch > 0){ // Don't fetch any pages if there are none to fetch
//                        for page in 2...pagesToFetch + 1{
//                            allPagesFetched.enter() //Enter the dispatch group
//                            let url = URL_PEOPLE + "?page=\(page)"
//
//                            Alamofire.request(url).responseJSON{ response in
//                                switch response.result{
//                                case .success(let json):
//                                    //print(json)
//
////                                    if let dict = json as? [String: Any]{
////                                        if let array = dict["results"] as? [Any]{
////                                            items.append(contentsOf: unpackJSONArray(array: array, type: type))
////                                        }
//
//                                    guard let data = response.data else { return }
//
//                                    do {
//
//                                        let json = try JSONDecoder().decode(StarParent.self, from: data)
//
//                                        items.append(contentsOf: json.results)
//
//                                        //check if count is lower than swpda
//                                        //                    if count > starWarsPeopleDataArray.count {
//                                        //
//                                        //                    } else {
//                                        //                        completion(starWarsPeopleDataArray)
//                                        //                    }
//                                        //if yes new call
//                                        //parsing
//                                        //append new elements
//
//                                    } catch let error {
//                                        debugPrint(error as Any)
//                                    }
//
//
//                                    }
//                                case .failure(let error):
//                                    print(error)
//                                }
//
//                                allPagesFetched.leave() //Leave the group now
//                            }
//                        }
//                    }
//
//
//                    if let array = dict["results"] as? [Any]{
//                        items.append(contentsOf: unpackJSONArray(array: array, type: type))
//                    }
//                }
//
//                allPagesFetched.notify(queue: DispatchQueue.main) {
//                    callback(items.sorted{$1.getName() > $0.getName() })
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

    func getAllStars(completion: @escaping CompletionHandlerForPeople){
        Alamofire.request(URL_PEOPLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
//                print(response)
                
                //Begin the somewhat nasty Swift JSON parsing. When will they make this easier?
                var starWarsPeopleDataArray: [Star] = [] //Hold the items that will be returned
                
                // Use a dispatch group to synchronize them all finishing
                let allPagesFetched = DispatchGroup()
                
                guard let data = response.data else { return }

                do {
                    let json = try JSONDecoder().decode(StarParent.self, from: data)
                    let items = json.results
                    starWarsPeopleDataArray.append(contentsOf: items)
                    guard let count = json.count else { return }
                    let pagesToFetch = count / SWAPI_ITEMS_PER_PAGE

                    ///Inner circle
                    if(pagesToFetch > 0){ // Don't fetch any pages if there are none to fetch
                        for page in 2...pagesToFetch + 1{
                            allPagesFetched.enter() //Enter the dispatch group
                            
                            let url = "https://swapi.co/api/people?page=\(page)"
                            print(url)
                            
                            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
                                if response.result.error == nil {
                                    print("naaaaaaaaa")
                                    guard let data = response.data else { return }
                                    
                                    
                                    ///Even deeper
                                    
                                    do {
                                        let json = try JSONDecoder().decode(StarParent.self, from: data)
                                        let Items = json.results
                                        print("ola")
                                        print(items)
                                        starWarsPeopleDataArray.append(contentsOf: Items)
                                
                                    } catch let error {
                                        debugPrint(error as Any)
                                    }
                                    
                                    ///
                                    
      
                                    
                                } else {
                                    completion(nil)
                                    debugPrint(response.result.error as Any)
                                }
                            allPagesFetched.leave()
                        }
                    }
                        
                        print(starWarsPeopleDataArray)
                        allPagesFetched.notify(queue: DispatchQueue.main) {
                            completion(starWarsPeopleDataArray.sorted{$0.name<$1.name})
                        }
                        
                    
                    ///
                    
                    }
                } catch let error {
                    debugPrint(error as Any)
                }
//                print(starWarsPeopleDataArray)
//                allPagesFetched.notify(queue: DispatchQueue.main) {
//                    completion(starWarsPeopleDataArray) //sort?
//                }
                
            } else {
                completion(nil)
                debugPrint(response.result.error as Any)
            }
        
    }
    }
    
    
    

    
    func findAllPeopleAllPages(completion: @escaping CompletionHandlerForPeople) {
        
        Alamofire.request(URL_PEOPLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                print(response)
                guard let data = response.data else { return }
                
                do {
                    
                    let json = try JSONDecoder().decode(StarParent.self, from: data)
                    guard let count = json.count else { return }
                    guard let next = json.next else { return }
                    print(next)
                    print(count)
                    let starWarsPeopleDataArray = json.results
                    
                    //check if count is lower than swpda
                    if count > starWarsPeopleDataArray.count {
                        
                    } else {
                        completion(starWarsPeopleDataArray)
                    }
                    //if yes new call
                    //parsing
                    //append new elements
                    
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


