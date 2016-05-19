//
//  MenuViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/7/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class Menu: NSObject {
    var menu:NSString!
    var options:NSMutableArray!
    var isExpanded:Bool!
    
    
    init(menu:NSString!,options:NSArray!,isExpanded:Bool!) {
        self.menu = menu
        self.options = NSMutableArray(array: options)
        self.isExpanded = isExpanded
    }
}

class MenuViewController: UIViewController {

    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var menuTableView: UITableView!
    let menuItems:NSMutableArray! = NSMutableArray()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utility.createCornerLayer(userImage)
        
        
         let myOrders:Menu! = Menu(menu: " My Order", options: [], isExpanded: false)
       
        let appointments:Menu! = Menu(menu: " Upcoming Appointment", options: [], isExpanded: false)
        let myWallet:Menu! = Menu(menu: " My Wallet", options: [], isExpanded: false)
        
        let rateCard:Menu! = Menu(menu: " Rate card", options: [], isExpanded: false)

       
        
        menuItems.removeAllObjects()
        menuItems.addObject(myOrders)
        menuItems.addObject(appointments)
        menuItems.addObject(myWallet)
        menuItems.addObject(rateCard)


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


extension MenuViewController : UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count
    }
    
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCellIdentifier")!
        
        let myMenu:Menu! = menuItems[indexPath.row] as! Menu
        
        
       // cell.textLabel?.text =  "    \(menu.options[indexPath.row] as! NSString as String)"
        

       cell.textLabel!.text =  myMenu.menu as String
        cell.imageView?.image = UIImage(named: "Beauty")
        return cell
        
    }



}

extension MenuViewController : UITableViewDelegate{

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if indexPath.row == 0{
        
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
         let myOrderViewController = storyBoard.instantiateViewControllerWithIdentifier("MyOrdersViewController") as? MyOrdersViewController
             sideMenuController()?.setContentViewController(myOrderViewController!)
        }
        
        else if indexPath.row == 1{
            let storyBoard = UIStoryboard(name:"Main", bundle: nil)
            let upcomingAppointmentViewController = storyBoard.instantiateViewControllerWithIdentifier("UpcomingAppointmentViewController") as? UpcomingAppointmentViewController
            sideMenuController()?.setContentViewController(upcomingAppointmentViewController!)
            
        }else if indexPath.row == 2{
         
            let storyBoard = UIStoryboard(name:"Main", bundle: nil)
            let myWalletViewController = storyBoard.instantiateViewControllerWithIdentifier("MyWalletViewController") as? MyWalletViewController
            sideMenuController()?.setContentViewController(myWalletViewController!)
        }else if indexPath.row == 3{
            
            let storyBoard = UIStoryboard(name:"Main", bundle: nil)
            let dashBoardViewController = storyBoard.instantiateViewControllerWithIdentifier("DashBoardViewController") as? DashBoardViewController
            sideMenuController()?.setContentViewController(dashBoardViewController!)
            
            
        }else if indexPath.row == 4{
        }
        
        
        
    }

}
