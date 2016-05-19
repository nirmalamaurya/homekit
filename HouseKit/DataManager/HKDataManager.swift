//
//  HKDataManager.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/6/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class HKDataManager: NSObject {
    
    private(set) internal var arrayHouseItems: [HouseHoldItem] = []
    
    class var sharedInstance: HKDataManager {
        
        struct Singleton {
            static let instance = HKDataManager()
        }
        return Singleton.instance
    }
    
    
    func prepareHouseHoldDataItems(){
        
        let  itemBeauty = HouseHoldItem(name: "Beauty",   image: "Beauty")
        let  itemComputer = HouseHoldItem(name: "Computer", image: "computer-service")
        let  itemPlumber = HouseHoldItem(name: "Plumber",  image: "tap")
        let  itemDriver = HouseHoldItem(name: "Driver",   image: "driving-test")
        let  itemAutoMobiles = HouseHoldItem(name: "AutoMobiles", image: "parked-car")
        let  itemFitness = HouseHoldItem(name: "Fitness",   image: "Fitness")
        let  itemLoundry = HouseHoldItem(name: "Loundry", image: "woman-and-laundry")
        let  itemPainting = HouseHoldItem(name: "Painting",  image: "art-painting-roller")
        let  itemCarpenter = HouseHoldItem(name: "Carpenter",   image: "carpenter")
        let  itemMobile = HouseHoldItem(name: "Mobile Repair", image: "mobile-marketing")
        let  itemHouseCleaning = HouseHoldItem(name: "House Cleaning", image: "man-vacuum")
        let  itemHouseAppliances = HouseHoldItem(name: "Appliances", image: "large-fridge")



        arrayHouseItems.append(itemBeauty)
        arrayHouseItems.append(itemComputer)
        arrayHouseItems.append(itemPlumber)
        arrayHouseItems.append(itemDriver)
        arrayHouseItems.append(itemAutoMobiles)
        arrayHouseItems.append(itemFitness)
        arrayHouseItems.append(itemLoundry)
        arrayHouseItems.append(itemPainting)
        arrayHouseItems.append(itemCarpenter)
        arrayHouseItems.append(itemMobile)
        arrayHouseItems.append(itemHouseCleaning)
        arrayHouseItems.append(itemHouseAppliances)

        
    }
    func getDataItems()->Array <HouseHoldItem>{
    
        prepareHouseHoldDataItems()
        return arrayHouseItems
    
    }
}



