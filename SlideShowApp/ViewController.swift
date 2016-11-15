//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 牧 里江子 on 2016/11/15.
//  Copyright © 2016年 riki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let photos = ["画像１.png", "画像２.png", "画像３.png", "画像４.png", "画像５.png", "画像６.png"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //タップを有効化する。
        imageView.isUserInteractionEnabled = true
        imageView.tag = 100
        
        let image:UIImage! = UIImage(named: photos[0])
        
        imageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // タッチイベントの検出
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch: UITouch in touches {
            let tag = touch.view!.tag
            switch tag {
            case 100:
                print("tapped")
                
                let storyboard = UIStoryboard(name: "Next", bundle: nil)
                //let viewController = storyboard.instantiateInitialViewController()
                
                let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController")as! NextViewController
                nextViewController.modalTransitionStyle = UIModalTransitionStyle.partialCurl
                // 値渡ししたい時 hoge -> piyo
                nextViewController.x = 0
                //nextController.x = self.hoge
                // Viewの移動する.


                //self.present(nextViewController as UIViewController, animated: true, completion: nil)
         
                
                
                
                
                
                // 遷移するViewを定義する.このas!はswift1.2では as?だったかと。
                //let nextiewController: NextViewController = self.storyboard?.instantiateInitialViewController()("secondVC") as? NextViewController
    // アニメーションを設定する.
    //secondViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
    // 値渡ししたい時 hoge -> piyo
    //secondViewController.piyo = self.hoge
    // Viewの移動する.
    //self.presentViewController(secondViewController, animated: true, completion: nil)
           default:
               break
           }
       }
    }

}

