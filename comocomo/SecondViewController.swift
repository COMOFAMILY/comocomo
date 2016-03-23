//
//  SecondViewController.swift
//  comocomo
//
//  Created by 양윤영 on 2016. 3. 7..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var appleProducts = ["한상현", "홍길동", "트위터", "김범철", "송규동", "박수진", "김범철", "오길탁","한상현", "홍길동", "트위터", "김범철", "송규동", "박수진", "김범철", "오길탁"]
      var appleProducts2 = Array<String>()
    
    let imageArray = [
        UIImage(named: "a"),
        UIImage(named: "b"),
        UIImage(named: "c"),
        UIImage(named: "d"),
        UIImage(named: "e"),
        UIImage(named: "f"),
        UIImage(named: "g"),
        UIImage(named: "h"),
        UIImage(named: "a"),
        UIImage(named: "b"),
        UIImage(named: "c"),
        UIImage(named: "d"),
        UIImage(named: "e"),
        UIImage(named: "f"),
        UIImage(named: "g"),
        UIImage(named: "h")
    ]
    
    let date = ["2012-12-13","2012-12-14","2012-12-15","2012-12-16","2012-12-17","2012-12-18","2012-12-18","2012-12-19","2012-12-13","2012-12-14","2012-12-15","2012-12-16","2012-12-17","2012-12-18","2012-12-18","2012-12-19"]
    
    let lorem = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://52.37.211.140:9000/users"

        let nsurl = NSURL(string: url)
        let data = NSData(contentsOfURL: nsurl!)

        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let blogs = json as? [[String: AnyObject]] {
                for blog in blogs {
                    if let name = blog["username"] as? String {
                        appleProducts2.append(name)
                    }
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
      
        

      
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
            //here you can do the logic for the cell size if phone is in landscape
        } else {
            //logic if not landscape
        }
        
        flowLayout.invalidateLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //아이템 몇개 출력??
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appleProducts2.count
    }


    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
       
                    let cell        = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
            
            cell.imageView?.image = self.imageArray[indexPath.row]
        
        
        
            cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2
            cell.imageView.clipsToBounds = true
            
            cell.writenDate?.text = self.date[indexPath.row]
            
            cell.titleLabel?.text = self.appleProducts2[indexPath.row]
            cell.review?.text = lorem
            return cell
        
        

        
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage"
        {
            let indexPaths = self.collectionView.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! SecondViewControllerDetail

            vc.image = self.imageArray[indexPath.row]!

            vc.namevar.text = self.appleProducts2[indexPath.row]
            vc.datevar.text = self.date[indexPath.row]
        }
    }
}

