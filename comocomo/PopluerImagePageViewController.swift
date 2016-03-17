//
//  PopluerImagePageViewController.swift
//  comocomo
//
//  Created by seojungwon on 2016. 3. 17..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import UIKit

class PopluerImagePageViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var imageFileName : String!
    var pageIndex : Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = UIImage(named:imageFileName)
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
