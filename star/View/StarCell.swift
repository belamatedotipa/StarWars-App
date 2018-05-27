//
//  starCell.swift
//  star
//
//  Created by Bela Mate Barandi on 5/20/18.
//  Copyright © 2018 Bela Mate Barandi. All rights reserved.
//

import UIKit

class StarCell: UITableViewCell {
    
    
    
    var link: MainVC?
    
    
   //MARK: - Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func starButtonPressed(_ sender: Any) {
        print("I'm in-pressed")
        link?.favMethod(cell: self)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configureCell(star: Star)  {
//        nameLbl.text = star.name
//    }

}
