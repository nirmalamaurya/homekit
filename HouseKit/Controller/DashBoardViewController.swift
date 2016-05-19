//
//  DashBoardViewController.swift
//  HouseKit
//
//  Created by Nirmala Maurya on 3/3/16.
//  Copyright © 2016 Nirmala Maurya. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController
{
    
    private let sectionInsets = UIEdgeInsets(top: 2.0, left: 5.0, bottom: 2.0, right: 5.0)


    var itemResult = [HouseHoldItem]()
    @IBOutlet weak var pagecontrol: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!

    let blogsArray:NSMutableArray = NSMutableArray()

    var currentPage : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Dashboard"
        
        
        
        let dataManager = HKDataManager.sharedInstance
       itemResult =  dataManager.getDataItems()
        
    getBlogs()

        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "moveToNextPage", userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        self.sideMenuController()?.sideMenu?.delegate = self
   
    }
    
    
    
    @IBAction func menuTapped(sender: AnyObject) {
        
        toggleSideMenuView()
        
        self.view.endEditing(true)
        
    }
    
    func moveToNextPage(){
        
        let pageWidth:CGFloat = CGRectGetWidth(self.scrollView.frame)
        let maxWidth:CGFloat = pageWidth * CGFloat(self.blogsArray.count)
        let contentOffset:CGFloat = self.scrollView.contentOffset.x
        var slideToX = contentOffset + pageWidth
        let pageWidth1:CGFloat = CGRectGetWidth(scrollView.frame)
        let currentPage: CGFloat = floor((scrollView.contentOffset.x-pageWidth1/2)/pageWidth1)+1
        
        if contentOffset + pageWidth == maxWidth{
            slideToX = 0
        }
        self.scrollView.scrollRectToVisible(CGRectMake(slideToX, 0, pageWidth, CGRectGetHeight(self.scrollView.frame)), animated: true)
        self.pagecontrol.currentPage = Int(currentPage);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getRandomColor() -> UIColor{
        
    let randomRed:CGFloat = CGFloat(drand48())
        
    let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
    
    func getBlogs(){
        
        let url : String = "https://public-api.wordpress.com/rest/v1.1/sites/blog.marspls.com%20/posts?number=5"
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse?, data: NSData?, error: NSError?) -> Void in

            do {
                let jsonResult:NSDictionary? = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSDictionary
                
                self.blogsArray.addObjectsFromArray(jsonResult!["posts"] as! [NSArray])
                self.pagecontrol.numberOfPages = self.blogsArray.count
                
                self.getImages()
                
            } catch  {
                
                
            }
            
        })
        
    }
    
    
    
    func getImages(){
        
        
        
        for var i = 0; i < self.blogsArray.count ; ++i {
            //We'll create an imageView object in every 'page' of our scrollView.
            
            let x =  self.scrollView.frame.size.width *  CGFloat ( i )
            let frame1 = CGRectMake(x, 0, self.scrollView.frame.size.width , self.scrollView.frame.size.height-20)
            let imageView =  UIImageView (frame: frame1)
            
            let blogLabel = UILabel(frame: CGRectMake(x, imageView.frame.size.height, self.scrollView.frame.size.width , 20))
            
            
            
            imageView.contentMode = .ScaleAspectFill
            imageView.clipsToBounds  = true
            blogLabel.textColor = UIColor.whiteColor()
            blogLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
            blogLabel.backgroundColor = UIColor(white: 0, alpha: 0.4)
            self.scrollView.addSubview(blogLabel)
            let dict: AnyObject = self.blogsArray.objectAtIndex(i)
            
            let imgURL: NSURL = NSURL(string: (dict["featured_image"] as? String)!)!
            
            dispatch_async(dispatch_get_main_queue(),{
                //imageView.image = UIImage (data:data)
                blogLabel.text =  dict["title"] as? String
                // println("dict = \(blogLabel.text)")
            })
            
            
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            
            //print(dict)
            //            let button: AnyObject = (UIButton.buttonWithType(UIButtonType.Custom) as? UIButton)!
            //
            //            button.frame  = frame1
            
            
            
            
            NSURLConnection.sendAsynchronousRequest(
                request, queue: NSOperationQueue.mainQueue(),
                completionHandler: {(response: NSURLResponse?,data: NSData?,error: NSError?) -> Void in
                    if error == nil {
                        
                        dispatch_async(dispatch_get_main_queue(),{
                            imageView.image = UIImage (data:data!)
                            //blogLabel.text =  dict["title"] as? String
                        })
                        
                        //(named: "22")  //
                    }
                    
                    
            })
            
            self.scrollView.addSubview(imageView)
            
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat (self.blogsArray.count) , self.scrollView.frame.size.height)
        
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
extension DashBoardViewController: UICollectionViewDelegateFlowLayout{
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return   self.itemResult.count == 0 ? 1 : self.itemResult.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: HouseHoldItemCell = (collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as? HouseHoldItemCell)!
        
            if self.itemResult.count > 0{
        
                if let houseItem:HouseHoldItem = itemResult[indexPath.row] as HouseHoldItem{
                    cell.itemName.text = houseItem.itemName
                    cell.itemImageView.image = UIImage(named: houseItem.itemImage)
                    
                    cell.backgroundColor = getRandomColor()
                }
        }
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
        if indexPath.row == 0{
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let hkDetailViewController: HKItemDetailViewController = (storyBoard.instantiateViewControllerWithIdentifier("HKItemDetailViewController") as? HKItemDetailViewController)!
        
        hkDetailViewController.itemDetailObject = self.itemResult[indexPath.row]
        
            self.navigationController?.pushViewController(hkDetailViewController, animated: true)
        
        }
            
            
        else if indexPath.row == 2{
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let loginViewController: LoginViewController = (storyBoard.instantiateViewControllerWithIdentifier("LoginViewController") as? LoginViewController)!
            
            
            self.navigationController?.pushViewController(loginViewController, animated: true)
            
        }
        
        else{
        
        
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            
            let serviceNotAvailableViewController: ServiceNotAvailableViewController = (storyBoard.instantiateViewControllerWithIdentifier("ServiceNotAvailableViewController") as? ServiceNotAvailableViewController)!
                        self.navigationController?.pushViewController(serviceNotAvailableViewController, animated: true)
            

        
        }
        
       // self.performSegueWithIdentifier("HKDetail", sender: indexPath)
        
    }
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
}


extension DashBoardViewController: ENSideMenuDelegate{

    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuShouldOpenSideMenu() -> Bool {
        print("sideMenuShouldOpenSideMenu")
        return true
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }


}

extension DashBoardViewController : UIScrollViewDelegate{
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let pageWidth = self.scrollView.frame.size.width;
        let   page = floor((self.scrollView.contentOffset.x - pageWidth ) / pageWidth) + 1;
        self.pagecontrol.currentPage = Int(page );
        
        currentPage = self.pagecontrol.currentPage
        
        // getImages()
    }
    
}
