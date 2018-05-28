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
    var starUIs: [StarUIModel] = []
    var starUISegment: [StarUIModel] = []
    var filteredStars: [StarUIModel] = []
    var dataService : DataService? = DataService()
    var detailService : DetailService? = DetailService()

    //For favorite button
    var favorites : [String:Bool] = [:]
    var buttonIsSelected = false
    var selectedSegmentIndex : Int = 0
    let searchController = UISearchController(searchResultsController: nil)
    var index: Int = 0
    
    //Wrapper for dto
    struct StarUIModel {
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
    @IBOutlet weak var searchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name or homeland"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        tableView.delegate = self
        tableView.dataSource = self
        
        getStars()

    }


    func getStars() {
        dataService?.findAllStars { (people) in
            
            guard let nameArray = people else {return}
            self.starUIs = nameArray.map {StarUIModel(star: $0)}
            self.starUISegment = self.starUIs
            self.tableView.reloadData()
            
        }
    }
    
    
    func favMethod(cell: UITableViewCell) {
 
        let indexPathTapped = tableView.indexPath(for: cell)


        if selectedSegmentIndex != 0 {
            var index = 0
        for n in starUIs {
            index += 1
            if n.name == starUISegment[indexPathTapped!.row].name {
              self.index = index-1
            }
            }
            starUIs[self.index].favorited = !starUIs[self.index].favorited
            starUISegment[indexPathTapped!.row].favorited = !starUISegment[indexPathTapped!.row].favorited
        } else {
            starUIs[indexPathTapped!.row].favorited = !starUIs[indexPathTapped!.row].favorited
            starUISegment[indexPathTapped!.row].favorited = !starUISegment[indexPathTapped!.row].favorited
        }
        tableView.reloadData()
    }
    
    // MARK: - Search helper functions
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredStars = starUISegment.filter({( star : StarUIModel) -> Bool in
            return (
             star.name.lowercased().contains(searchText.lowercased())
                 || star.homeworld.lowercased().contains(searchText.lowercased())
            )
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
       //MARK: - Actions
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        //let selectedSegmentIndex = sender.selectedSegmentIndex
        selectedSegmentIndex = sender.selectedSegmentIndex
        switch selectedSegmentIndex {
        case 1:
            starUISegment = starUIs.sorted(by: {$0.birthYear<$1.birthYear})
            tableView.reloadData()
        case 2:

            starUISegment = starUIs.filter { $0.favorited }
            tableView.reloadData()
        default:
            starUISegment = starUIs.sorted(by: {$0.name<$1.name})
            tableView.reloadData()
        }

}
}

// MARK: - TableView Delegate
extension MainVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if isFiltering() {
            return filteredStars.count
        }
        return starUISegment.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let star = starUISegment[indexPath.row]
        performSegue(withIdentifier: DETAIL_VC, sender: star)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DETAIL_VC {
            if let destination = segue.destination as? DetailVC {
                if let star = sender as? StarUIModel {
                    destination.star = star
                }
            }
        }
    }
    
}

// MARK: - TableView DataSource
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: STAR_CELL, for: indexPath) as? StarCell {
            
            let star: StarUIModel
            
            if isFiltering() {
                star = filteredStars[indexPath.row]
            } else {
                star = starUISegment[indexPath.row]
            }

            cell.link = self
            cell.nameLbl.text = star.name.lowercased()
            
            if star.favorited {
                cell.starButton.setImage(UIImage(named:  FAV_FILLED), for: .normal)
            } else {
                cell.starButton.setImage(UIImage(named:  FAV_EMPTY), for: .normal)
            }

            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UISearchResultsUpdating Delegate
extension MainVC: UISearchResultsUpdating {
  
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)    }
}


//TODO: - replace selectedindex with this
//private extension SegmentedKey {
//    var segmentIndex : Int {
//        switch self {
//        case .name:
//            return 0
//        case .birthYear:
//            return 1
//        case .favorite:
//            return 2
//        }
//}
//}








