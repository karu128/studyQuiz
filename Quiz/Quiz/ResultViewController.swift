//
//  ResultViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/01/22.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var questionnumber: Int = 0
    var correctAnswer: Int = 0
    
    
    @IBOutlet var end: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var image1: UIImageView!
    
   
    let ResultPic0:UIImage! = UIImage(named:"doragon.jpg")
    let ResultPic1:UIImage! = UIImage(named:"ninngenn.png")
    let ResultPic2:UIImage! = UIImage(named:"namakemono.jpg")
    let ResultPic3:UIImage! = UIImage(named:"aho.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSuserDefaultから取り出したい

        //pointは正答率（0.0ー1.0)
        let point :Double = Double(correctAnswer) / Double(questionnumber)
        NSLog("正解率は%dだ" , point)
        resultLabel.text = String("正解率　-> \(point*100)%")
        if point == 1 {
            resultLabel.text = String("全問正解！\nおめでとうございます！\nあなたの常識度は神レベルです")
            image1.image = ResultPic0
            
            
        }else if point > 0.7 {
          resultLabel.text = String("あなたの常識度は人間レベルです")
          image1.image = ResultPic1
        }else if point > 0.3 {
          resultLabel.text = String("あなたの常識度は猿レベルです")
          image1.image = ResultPic2
        }else {
        resultLabel.text = String("あなたの常識度はナマケモノレベルです\n頑張りましょう")
        image1.image = ResultPic3
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToTop() {
        self.presentingViewController?.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }

}
