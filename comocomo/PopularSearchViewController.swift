//
//  PopularSearchViewController.swift
//  comocomo
//
//  Created by seojungwon on 2016. 3. 17..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import UIKit

class PopularSearchViewController: UIViewController, UIPageViewControllerDataSource {

        
    var pageImages : NSArray!
    var pageViewController : UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageImages = NSArray(objects: "screen1", "screen2", "screen3")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PopularSearchImagePageController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        var initialContenViewController = self.pageAtIndex(0) as PopluerImagePageViewController
        var viewControllers = NSArray(objects: initialContenViewController)
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction:UIPageViewControllerNavigationDirection.Forward, animated: true, completion:nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 400)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
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
    
    func pageAtIndex(index: Int) -> PopluerImagePageViewController {
        var pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PopularImagePageViewController") as! PopluerImagePageViewController
        
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        var viewController = viewController as! PopluerImagePageViewController
        var index = viewController.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index--
        
        return self.pageAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        var viewController = viewController as! PopluerImagePageViewController
        var index = viewController.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index++
        
        if(index == pageImages.count) {
            return nil
        }
        
        return self.pageAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
