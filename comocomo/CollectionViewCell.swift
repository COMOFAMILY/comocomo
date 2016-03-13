//
//  CollectionViewCell.swift
//  comocomo
//
//  Created by 한상현 on 2016. 3. 13..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var writenDate: UILabel!
    
    func viewDidLoad() {
        
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.blackColor().CGColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
    
}
