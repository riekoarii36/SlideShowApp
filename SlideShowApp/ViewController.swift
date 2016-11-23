//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 牧 里江子 on 2016/11/15.
//  Copyright © 2016年 riki. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var play: UIButton!
    
    let photos = ["画像１.png", "画像２.png", "画像３.png", "画像４.png", "画像５.png", "画像６.png"]
    
    var index:Int = 0
    var timer : Timer!

    @IBOutlet weak var btnGo: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //タップを有効化する。
        imageView.isUserInteractionEnabled = true
        imageView.tag = 100
        
        let image:UIImage! = UIImage(named: photos[index])
        
        imageView.image = image
        
        timerInitialized()
        timerStop()

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
                
            //let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "Next")as! NextViewController
            
            //nextViewController.pic = photos[index]
            
            performSegue(withIdentifier: "segueNext", sender: nil)
                
            default:
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueNext"){            
            let nextViewController:NextViewController = segue.destination as! NextViewController
            
            nextViewController.x = index
            nextViewController.pic = photos[index]

        }
    }
    
    func nextPage(){
        if (index <= 3) {
            index += 1
        }else{
            index = 0
        }
        imageView.image = UIImage(named: photos[index])
        self.view.addSubview(imageView)
    }
    
    func timerInitialized(){
        timer = Timer.scheduledTimer(timeInterval: 2, target : self, selector : #selector(ViewController.nextPage), userInfo: nil, repeats:true)
    }
    
    func timerStart(){
        if(!timer.isValid){
            timerInitialized()
        }
    }
    
    func timerStop(){
        if(timer.isValid){
            timer.invalidate()
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    @IBAction func go(_ sender: AnyObject) {
        if (index <= 3) {
            index += 1
        }else{
            index = 0
        }
        imageView.image = UIImage(named: photos[index])
        self.view.addSubview(imageView)
        
    }
    
    @IBAction func back(_ sender: AnyObject) {
        if (index <= 0) {
            index = 4
        }else{
            index -= 1
        }
        imageView.image = UIImage(named: photos[index])
        self.view.addSubview(imageView)
    }
    
    @IBAction func play(_ sender: AnyObject) {

        if(play.currentTitle == "再生"){
            imageView.image = UIImage(named: photos[index])
            self.view.addSubview(imageView)
            self.play.setTitle("停止", for: UIControlState.normal)
            self.btnGo.isEnabled = false
            self.btnBack.isEnabled = false
            timerStart()
        }else{
            self.play.setTitle("再生", for: UIControlState.normal)
            self.btnGo.isEnabled = true
            self.btnBack.isEnabled = true
            timerStop()
        }
    }
    
}

