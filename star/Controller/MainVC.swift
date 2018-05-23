//
//  ViewController.swift
//  star
//
//  Created by Bela Mate Barandi on 5/18/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: - Properties
    
    
    var currentSort : [Star] = []
    let image1 = UIImage(named: FAV_EMPTY) as UIImage?
    let image2 = UIImage(named: FAV_FILLED) as UIImage?
    
    //for fav button
    var favorites : [String:Bool] = [:]
    var buttonIsSelected = false
    
    //Wrappers for extended struct
    fileprivate struct StarUIModel {
        var name: String
        var height: String
        var mass: String
        var hairColor: String
        var skinColor: String
        var eyeColor: String
        var birthYear: String
        var gender: String
        var homeworld: String
        var films: [String]?
        var species: [String]?
        var vehicles: [String]?
        var starships: [String]?
        var created: String
        var edited: String
        var url: String
        var favorited: Bool
        
        init(star: Star) {
            // TODO: notification.type image
            name = star.name
            height = star.height
            mass = star.mass
            hairColor = star.mass
            skinColor = star.skin_color
            eyeColor = star.eye_color
            birthYear = star.birth_year
            gender = star.gender
            homeworld = star.homeworld
            films = star.films
            species = star.species
            vehicles = star.vehicles
            starships = star.starships
            created = star.created
            edited = star.edited
            url = star.url
            favorited = false
            }
    }
    

    
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!


    override func viewDidLoad() {
        super.viewDidLoad()


        tableView.delegate = self
        tableView.dataSource = self
        getPeople()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    //MARK: - Functions
    
    func getPeople() {
        DataService.instance.findAllPeople { (success) in
            if success {
                
                self.tableView.reloadData()
                
               //Update tableview
                } else {
                    //Handle Error
                }
                // do stuff with data
            let dataService = DataService()
            
            let starModelss = self.dataService.nameArray.map { (star) -> StarUIModel in
                return star
            }
            }
        }
    
    func favMethod(cell: UITableViewCell) {
       print("yay")
        let indexPathTapped = tableView.indexPath(for: cell)
        print(indexPathTapped)
        //FIXMe: chacnge array to dict once it works
        var favoritedStar = DataService.instance.nameArray[indexPathTapped!.row]
        
        
//        guard var hasFavorited = favoritedStar.favorited else {
//            favoritedStar.favorited = true
//            return
//        }
//        favoritedStar.favorited = !favoritedStar.favorited
        
        if favoritedStar.favorited == nil {
            favoritedStar.favorited = true
        } else {
            favoritedStar.favorited = !favoritedStar.favorited!
        }
        print(DataService.instance.nameArray[indexPathTapped!.row])
        print(favoritedStar)
        tableView.reloadData()
        
        print(favoritedStar)
        
        
    }
    
    
    
    
       //MARK: - Actions
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        var selectedSegmentIndex = sender.selectedSegmentIndex
        
        tableView.reloadData()
    }
    

    
    
    
    }







extension MainVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //dump(DataService.instance.starDict[segmentIndex])
        
        //return DataService.instance.starDict[segmentIndex]!.count
        return DataService.instance.nameArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let star = DataService.instance.nameArray[indexPath.row]
        //let star = DataService.instance.starDict[segmentIndex]![indexPath.row]
        
        performSegue(withIdentifier: DETAIL_VC, sender: star)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DETAIL_VC {
            if let destination = segue.destination as? DetailVC {
                if let star = sender as? Star {
                    destination.star = star
                }
            }
        }
    }
    
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: STAR_CELL, for: indexPath) as? StarCell {
            
            let star = DataService.instance.nameArray[indexPath.row]
            //let star = DataService.instance.starDict[segmentIndex]![indexPath.row]
            cell.link = self
            cell.configureCell(star: star)
            //favorites[star.name] = false
            print(star.favorited)
            if star.favorited != nil {
                cell.starButton.tintColor = star.favorited! ? UIColor.yellow:UIColor.lightGray
                print(cell.starButton.tintColor)
            }
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

private extension SegmentedKey {
    var segmentIndex : Int {
        switch self {
        case .name:
            return 0
        case .birthYear:
            return 1
        case .favorite:
            return 2
        }
}
}






