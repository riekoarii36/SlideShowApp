//
//  NextViewController.swift
//  SlideShowApp
//
//  Created by 牧 里江子 on 2016/11/15.
//  Copyright © 2016年 riki. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

//    let photos = ["画像１.png", "画像２.png", "画像３.png", "画像４.png", "画像５.png", "画像６.png"]

    @IBOutlet weak var nextimageView: UIImageView!
    
    var pic:String = ""
    var x:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nextimageView.image = UIImage(named: pic)
        //nextimageView.image = UIImage(named: pic)
        //self.nextimageView.addSubview(nextimageView)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
