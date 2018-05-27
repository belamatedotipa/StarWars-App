//
//  DetailVC.swift
//  star
//
//  Created by Bela Mate Barandi on 5/20/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
     //MARK: - Properties
    var detailService : DetailService? = DetailService()
    
    var star : MainVC.StarUIModel!

    
    var filmURLArray: [String] = []
    var fileteredFilmArray: [Film] = []
    var film : [Film] = []
  
    
    //Tableview
    let SectionHeaderHeight: CGFloat = 25
    enum TableSection: Int {
        case homeworld = 0
        case films = 1
        case vehicles = 2
        case total = 3
    }
    
    var data = [TableSection: [String]]()

    //MARK: - Outlets
    @IBOutlet weak var detailTableView: UITableView!
    
    
    func sortData() {
        data[.homeworld] = [star.homeworld]
        data[.films] = star.films
        data[.vehicles] = star.vehicles

    }
    
    
    //MARK: - VC
    override func viewDidLoad() {
        super.viewDidLoad()
        sortData()
        detailTableView.reloadData()

    
        //tableview setup
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        detailTableView.reloadData()
        
         // Do any additional setup after loading the view.
    }


}

extension DetailVC: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DETAIL_CELL, for: indexPath) as! DetailCell
        // Similar to above, first check if there is a valid section of table.
        // Then we check that for the section there is a row.
        
        
        if let tableSection = TableSection(rawValue: indexPath.section), let detail = data[tableSection]?[indexPath.row] {
            print(tableSection)
            switch tableSection {
            case .homeworld:
                //guard let url = data[tableSection]?[indexPath.row] else {return}
                detailService?.findPlanet(url: detail, completion: { (planet, error) in
                    guard let item = planet else {return}
                    let name = item.name
                   cell.detailLabel.text = name
                })
            case .films:
                detailService?.findFilm(url: detail, completion: { (film, error) in
                    guard let item = film else {return}
                    let name = item.title
                    cell.detailLabel.text = name
                })
            case .vehicles:
                detailService?.findVehicle(url: detail, completion: { (vehicle, error) in
                    guard let item = vehicle else {return}
                    let name = item.name
                    cell.detailLabel.text = name
                })
            case .total:
                print("total")
            }
            
        }
        return cell
    }
}

extension DetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Using Swift's optional lookup we first check if there is a valid section of table.
        // Then we check that for the section there is data that goes with.
        if let tableSection = TableSection(rawValue: section), let starData = data[tableSection] {
            return starData.count
        }
        return 0

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.total.rawValue
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // If we wanted to always show a section header regardless of whether or not there were rows in it,
        // then uncomment this line below:
        //return SectionHeaderHeight
        // First check if there is a valid section of table.
        // Then we check that for the section there is more than 1 row.
        if let tableSection = TableSection(rawValue: section), let starData = data[tableSection], starData.count > 0 {
            return SectionHeaderHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9098039216, blue: 0.1215686275, alpha: 1)
//            UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
    
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .homeworld:
                label.text = "Homeworld"
            case .films:
                label.text = "Films"
            case .vehicles:
                label.text = "Vehicles"
            default:
                label.text = ""
            }
        }
        view.addSubview(label)
        return view
    }

    
    

    
    
}
