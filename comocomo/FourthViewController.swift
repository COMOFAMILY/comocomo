//
//  FourthViewController.swift
//  comocomo
//
//  Created by 양윤영 on 2016. 3. 7..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import Foundation
import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var containerViewA: UIView!
    @IBOutlet weak var containerViewB: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!

    @IBAction func showSearchResult(sender: AnyObject) {
        let resultsController = UITableViewController(style: .Plain)
        let searchController = UISearchController(searchResultsController: resultsController)
        self.presentViewController(searchController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toggle(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animateWithDuration(0.5, animations: {
                self.containerViewA.alpha = 1
                self.containerViewB.alpha = 0
            })
        } else {
            UIView.animateWithDuration(0.5, animations: {
                self.containerViewA.alpha = 0
                self.containerViewB.alpha = 1
            })
        }
    }
    
}
