//
//  ServiceNotAvailableViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/6/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class ServiceNotAvailableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {

         self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
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
