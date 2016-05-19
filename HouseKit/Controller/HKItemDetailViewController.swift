//
//  HKItemDetailViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/6/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class HKItemDetailViewController: UIViewController {

    var itemDetailObject: HouseHoldItem!
    
    var sectionTitle:NSMutableArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  self.navigationController?.navigationBarHidden = false
        
    sectionTitle = ["Waxing", "Hain Care - Global", "Skin Indulge", "Skin Excellent", "Monthly Beauty pack"]
        

       self.title = itemDetailObject.itemName
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HKItemDetailViewController:UITableViewDataSource{
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
            return  1
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
            let cellIdetifier = "BeautyTableViewCell"
            let cell:BeautyTableViewCell = (tableView.dequeueReusableCellWithIdentifier(cellIdetifier)! as? BeautyTableViewCell)!
            
        
        
            return cell
        
        
           }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
            let view:UIView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
            let button:UIButton = UIButton(type: UIButtonType.ContactAdd)
             button.frame = CGRectMake(10, 10, 30, 30)
            button.tintColor = UIColor(red: 163/255, green: 21/255, blue: 21/255, alpha: 1.0)
            button.tag = section
            button.addTarget(self, action: Selector("Add_Tapped:"), forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(button)
            let label:UILabel = UILabel(frame: CGRectMake(10, 10, tableView.frame.size.width - 50, 30))
            label.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
            label.textColor = UIColor(red: 163/255, green: 21/255, blue: 21/255, alpha: 1.0)
            label.text = "         " + (sectionTitle[section] as! String) 
            view.addSubview(label)
            view.layer.borderColor = UIColor.lightGrayColor().CGColor
            view.layer.borderWidth = 1.0
            view.layer.masksToBounds = true
            return view
        
        
       
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        if(indexPath.section == 0){
//            
//            return 125
//            
//        }else if(indexPath.section == 1 ){
//            
//            return 210
//            
//            
//        }else {
//            
//            return 175
//        }
//        
//        
//    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
            return 50
            
        
    }
    
}

