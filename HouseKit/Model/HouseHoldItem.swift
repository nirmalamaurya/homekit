//
//  HouseHoldItem.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/6/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class HouseHoldItem: NSObject {
    
    
   private(set) internal   var itemName: String!   // Item name
   private(set) internal   var itemImage:String!   // Item Image name
    
    init(name: String, image:String){   // init method to create object of model class
        self.itemName  = name
        self.itemImage = image
    }
}
