//
//  LoginViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/7/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var facebookButton: UIButton!
    
    @IBOutlet weak var googlePlusButton: UIButton!
    @IBOutlet weak var forgotPwdButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var paswordField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    @IBOutlet weak var contactNumberField: UITextField!
    @IBOutlet weak var signUpView: UIView!

    @IBOutlet weak var signUpViewHeight: NSLayoutConstraint!
    
    

    var signUpVHeight:CGFloat!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
    
        signUpVHeight  = signUpViewHeight.constant
        Utility.createCornerLayer(facebookButton)
        Utility.createCornerLayer(googlePlusButton)
       
    }
    
    
    @IBAction func existingUserAction(sender:AnyObject){
        
        let btn = sender as? UIButton
    
        if btn!.selected == true{
        
            
        signUpViewHeight.constant = signUpVHeight
        signUpView.hidden = false
        btn!.selected = false
        }
        
        
        else{
            btn!.selected = true
            signUpView.hidden = true
            signUpViewHeight.constant = 0
        }
    
     
    }
    
    @IBAction func registerButtonAction(sender:AnyObject){
        
       
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dashBoard = storyBoard.instantiateViewControllerWithIdentifier("DashBoardViewController") as? DashBoardViewController
        self.navigationController?.pushViewController(dashBoard!, animated: true)
        
        
    }
    
    @IBAction func forgotPassword(sender:AnyObject){
        
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
