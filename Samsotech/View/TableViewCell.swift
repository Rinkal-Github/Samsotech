//
//  TableViewCell.swift
//  Samsotech
//
//  Created by Rinkal Saradva on 22/12/2020.
//

import UIKit

class TableViewCell: UITableViewCell {
//Suggested list
    @IBOutlet weak var lbl_suggested: UILabel!
    
    
    //hoteslListing
    
    
    @IBOutlet weak var lbl_oldPrice: UILabel!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var lbl_customerRatings: UILabel!
    @IBOutlet weak var lbl_hotelAddress: UILabel!
    @IBOutlet weak var lbl_hotelRatings: UILabel!
    @IBOutlet weak var lbl_hotelName: UILabel!
    @IBOutlet weak var img_hotelimage: UIImageView!
    
    
    
    //Reviews
    
    @IBOutlet weak var lbl_mainheading: UILabel!
    
    @IBOutlet weak var lbl_name: UILabel!
   
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var lbl_subheading: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
