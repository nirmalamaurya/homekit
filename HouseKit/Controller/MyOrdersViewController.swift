//
//  MyOrdersViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/10/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class MyOrdersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func menuTapped(sender: AnyObject) {
        
        toggleSideMenuView()
        
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func Back_Tapped(sender: AnyObject) {
        
        if (self.navigationController?.popViewControllerAnimated(true) != nil){
            
        }else{
            // self.app.Fn_AddDashboardController()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let dashBoardViewController = storyboard.instantiateViewControllerWithIdentifier("DashBoardViewController") as! DashBoardViewController
            sideMenuController()?.setContentViewController(dashBoardViewController)
        }
        
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


extension MyOrdersViewController : UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyOrderTableViewCell") as? MyOrderTableViewCell
        
        cell?.orderId.text = "Order ID: 3456788"
        cell?.orderDate.text = "Placed on 25th, Feb 2016"
        cell?.orderImageView.image = UIImage(named: "technology")
        
        return cell!
        
    }
}
extension MyOrdersViewController : UITableViewDelegate{
}