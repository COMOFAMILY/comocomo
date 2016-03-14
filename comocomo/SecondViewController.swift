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
    
    let appleProducts = ["양윤영", "한상현", "서정원", "손민희","송규동", "오준영", "최지인", "오길탁"]
    
    let imageArray = [
        UIImage(named: "a"),
        UIImage(named: "b"),
        UIImage(named: "c"),
        UIImage(named: "d"),
        UIImage(named: "c"),
        UIImage(named: "d"),
        UIImage(named: "c"),
        UIImage(named: "d")
    ]
    
    let date = ["2012-12-13","2012-12-14","2012-12-15","2012-12-16","2012-12-17","2012-12-18","2012-12-18","2012-12-19"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //아이템 몇개 출력??
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appleProducts.count
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell        = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell

     

        
        let AccountCell = collectionView.dequeueReusableCellWithReuseIdentifier("account", forIndexPath: indexPath) as! CollectionViewCell
        

        

        AccountCell.my

        AccountCell.myType1?.text = "건성"
        AccountCell.myType2?.text = "건성"
        AccountCell.myType3?.text = "건성"
        
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2
        cell.imageView.clipsToBounds = true
        
        cell.writenDate?.text = self.date[indexPath.row]
        
        cell.titleLabel?.text = self.appleProducts[indexPath.row]
        
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
            vc.title = self.appleProducts[indexPath.row]
            vc.textvar.text = self.date[indexPath.row]
        }
    }
}

