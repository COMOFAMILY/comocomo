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
    
    @IBOutlet weak var review: UITextView!
    
    @IBAction func likeButton(sender: AnyObject) {
    }
    func viewDidLoad() {
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    
    }
    
}
