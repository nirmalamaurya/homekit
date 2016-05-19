//
//  MyOrderTableViewCell.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/10/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class MyOrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var orderId:UILabel!
    @IBOutlet weak var orderDate:UILabel!
    @IBOutlet weak var orderImageView:UIImageView!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
