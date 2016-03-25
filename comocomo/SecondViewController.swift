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
    
    var writerName = Array<String>()
    var writenDate = Array<NSDate>()
    var writerProfile = Array<UIImage>()
    var contents = Array<String>()
    let unload = UIImage(named:"unload_image")//프로필이 없는경우 기본 사진으로 설정
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://52.37.211.140:9000/getReview" //리뷰를 불러오는 명령
        let nsurl = NSURL(string: url)
        let data = NSData(contentsOfURL: nsurl!)
        
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            
            if let jsonDatalist = json as? [[String: AnyObject]] { //파싱을 시작한다.
                for jsonData in jsonDatalist {
                    //작성자 이름을 가져와서 배열에 추가
                    if let isname = jsonData["userName"] as? String {
                        writerName.append(isname)
                    }
                    //작성된 날자를 가져와서 배열에 추가 
                    //dateFormatter가 날짜형식을 정해줌
                    if let isdate = jsonData["date"] as? String {
                        
                        let dateFormatter = NSDateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
                        
                        let date: NSDate? = dateFormatter.dateFromString(isdate)
                        
                        writenDate.append(date!)
                        
                    }
                    
                    //profile속성을 db에서 확인해서 값이 있으면 사진을 보여주고 
                    //값이 없으면 기본 사진인 unload_image사진을 보여준다.
                    if let profile = jsonData["profile"] as? String{
                       let image : UIImage = UIImage(named:"\(profile)")!
                        writerProfile.append(image)
                        
                    }
                    else{
                        writerProfile.append(unload!)
                    }
                    
                    if let content = jsonData["content"] as? String {
                         contents.append(content)
                    }
                    
                    
                }
            }
        } catch {
            print("error serializing JSON: \(error)")
        }
        
      
        print(writenDate)

      
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //아이템 몇개 출력??
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.writerName.count
    }


    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
       
                    let cell        = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
            
            cell.imageView?.image = self.writerProfile[indexPath.row]
        
        
        
            cell.imageView.layer.cornerRadius = cell.imageView.frame.size.width / 2
            cell.imageView.clipsToBounds = true
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
        
            cell.writenDate?.text = dateFormatter.stringFromDate(self.writenDate[indexPath.row])
        cell.titleLabel?.text = self.writerName[indexPath.row]
            cell.review?.text = self.contents[indexPath.row]
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

            
//            if self.writerProfile[indexPath.row].isEqual(unload){
//                vc.image = UIImage(named: "basic_background")!
//            }else{
                vc.image = self.writerProfile[indexPath.row]
//            }
            vc.namevar.text = self.writerName[indexPath.row]
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.zzzZ"
            
            vc.datevar.text = dateFormatter.stringFromDate(self.writenDate[indexPath.row])
            
        }
    }
}

