//
//  FirstViewController.swift
//  comocomo
//Users/Sudal_YANG/Documents/Xcode/comocomo/comocomo/comocomo/AppDelegate.swift/
//  Created by 양윤영 on 2016. 3. 7..
//  Copyright © 2016년 양윤영. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var videoView: UIWebView!
    
    var productName = ["미네랄 멜팅 쿠션", "로즈 에스쁘아 립스틱 노웨어G", "제네피크 유스 엑티베이팅 컨센트레이터"]
    var brandName = ["이니스프리", "에스쁘아", "LANCOM"]
    var skinProp = ["#지복합성#민감성#저렴", "#매트한#선명한#적당한가격", "#매트#차분함#높은가격"]
    var images = [UIImage(named: "a"),UIImage(named: "b"), UIImage(named: "c")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videoView.allowsInlineMediaPlayback = true // 인라인 뷰로 재생 가능하도록 true
//        let youtubeURl = "https://www.youtube.com/embed/ZryhViOvQF0"

//        videoView?.loadHTMLString("<iframe width=\"\(videoView.frame.width)\" height=\"\(videoView.frame.height)\" src=\"\(youtubeURl)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        //?&playsinline의 값을 1(참)로 줌으로써 프레임 안에서 바로 재생 가능


        videoView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ZryhViOvQF0\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
        let statusBarColor = UIColor(red: 254/255.0, green: 109/255.0, blue: 102/255.0, alpha: 1)
        let colorStateBar : UIView = UIView(frame: CGRectMake(0,0,self.view.frame.size.width, 20))
        colorStateBar.backgroundColor = statusBarColor
        self.view.addSubview(colorStateBar)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int {
        return self.productName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        
//        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        
        
        cell.productImg?.image = self.images[indexPath.row]
        cell.productName?.text = self.productName[indexPath.row]
        cell.brandName?.text = self.brandName[indexPath.row]
        cell.skinProp?.text = self.skinProp[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

