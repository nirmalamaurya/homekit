//
//  UpcomingAppointmentViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/10/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class UpcomingAppointmentViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
