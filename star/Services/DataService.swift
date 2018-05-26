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
    //static let instance = DataService()
    var star : [Star] = []
    // var starDict: [SegmentedKey: [Star]] = [:]

    
    
    //proba
    var nameArray : [Star] = []
    var birthArray : [Star] = []
    //var starDict_proba: [IntSortKey: [Star]] = [:]
    
    
    
    //MARK: - Functions
    func findAllPeople(completion: @escaping CompletionHandler) {
       
            Alamofire.request(URL_PEOPLE, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
                if response.result.error == nil {
  //                  print(response)
                    guard let data = response.data else { return }
                    

                    do {
 
                        let json = try JSONDecoder().decode(StarParent.self, from: data)

                        let starWarsPeopleDataArray = json.results
                        

                    print(starWarsPeopleDataArray[0])
                        var sortedbyName = starWarsPeopleDataArray.sorted(by: { $0.name < $1.name })

 //                       print(sortedbyName)
                        
                        var sortedbyBirth = starWarsPeopleDataArray.sorted(by: { $0.birth_year < $1.birth_year })
//                        self.starDict[.name] = sortedbyName
//                        print(self.starDict[.name]?.count)
//                        print("na")
//                        print(self.starDict.keys)
                       self.nameArray = sortedbyName
//                        self.nameArray.map({ $0.favorited = true
                       // })
                        self.birthArray = sortedbyBirth
//                        self.starDict[.birthYear] = sortedbyBirth
//                        self.starDict[.favorite] = []
                        
                            
                        
                        
                    } catch let error {
                        debugPrint(error as Any)
                    }
                
//                    completion(Error)
                    
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
                }
                
            }

    
    
}
    
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


