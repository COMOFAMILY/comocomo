//
//  SecondViewControllerDetail.swift
//  comocomo
//
//  Created by 한상현 on 2016. 3. 13..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import UIKit

class SecondViewControllerDetail: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var dateField: UILabel!
      
    var image = UIImage()
    var datevar = UILabel()
    var namevar = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.imageView.image = self.image
        self.nameField.text = self.namevar.text
        self.dateField.text = self.datevar.text
        self.backgroundView.image = self.image
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.whiteColor().CGColor
        imageView.layer.borderWidth = 4
        

       //이미지가 뷰를 넘어가지 않도록 해줌
        self.imageView.layer.masksToBounds = true
         self.backgroundView.layer.masksToBounds = true
        

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
