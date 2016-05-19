//
//  MyNavigationController.swift
//  SwiftSideMenu
//
//  Created by Evgeny Nazarov on 30.09.14.
//  Copyright (c) 2014 Evgeny Nazarov. All rights reserved.
//

import UIKit

class MyNavigationController: ENSideMenuNavigationController, ENSideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menuController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menuController, menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad{
            
            sideMenu?.menuWidth = 300.0 // optional, default is 160
        }else{
            
            sideMenu?.menuWidth = 252.0 // optional, default is 160
        }
        sideMenu?.bouncingEnabled = false
        view.bringSubviewToFront(navigationBar)
 
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
