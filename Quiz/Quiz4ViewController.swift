//
//  Quiz4ViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/02/05.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit

class Quiz4ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var EGtittle: UIImageView!
    
    @IBOutlet var EGQlabel: UILabel!
    
    @IBOutlet var quiztext: UITextView!
    
    @IBOutlet var answer: UITextField!
    
    @IBOutlet var EGkettei: UIButton!
    
    @IBOutlet var EGanswer: UILabel!
    
    @IBOutlet var back: UIButton!
    
    @IBOutlet var next: UIButton!
    
    //正解数
    var correctAnswer: Int = 0
    //問題文を格納する配列
    var quizArray  = [[AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        answer.delegate = self
        
        
        var tmpArray = [[AnyObject]]()
        
        //英語の問題文を書いていく
        tmpArray.append(["ハエは英語でフライ。ではゴキブリは英語で何という？","コックローチ"])
        tmpArray.append(["教室では教壇、階段では踊り場、駅やバス停では乗り降りするところ。さて共通する英語は何？","プラットホーム"])
        tmpArray.append(["英語では「グローブフィッシュ」。怒るとおなかをふくらませる魚と言えば何？","ふぐ"])
        tmpArray.append(["英語でレッドペッパーと言えばトウガラシ。ではグリーンペッパーと言えばどんな野菜？","ピーマン"])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
//        tmpArray.append(["",""])
        
        
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuiz()
        // Do any additional setup after loading the view.
    }
    
    
    func choiceQuiz() {
        quiztext.text = quizArray[0][0] as! String
    }
    
    //改行ボタンが押された時に呼ばれるデリゲードメソッド
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func `return`(sender: AnyObject){
        self.dismissViewControllerAnimated(true,completion:nil)
    }
    
    @IBAction func answer(sender: AnyObject) {
        
        let inputText = answer.text
        
        if inputText! == quizArray[0][1] as! String{
            
            EGanswer.text = "正解"
            //            AVAudioPlayerUtil.setValue(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bat-koukaon", ofType: "mp3")!));//ファイルセット（再生前事前準備）
            //            AVAudioPlayerUtil.play();
            
        }else{
            
            EGanswer.text = "不正解"
            //            AVAudioPlayerUtil.setValue(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("out", ofType: "wav")!));//ファイルセット（再生前事前準備）
            //            AVAudioPlayerUtil.play();
        }
    }
    @IBAction func next(sender: AnyObject) {
        quizArray.removeAtIndex(0)
        
        if quizArray.count != 0 {
            
            quiztext.text = quizArray[0][0] as! String
            EGanswer.text = ""
            answer.text = ""
            
        }else{
            
            performSegueWithIdentifier("toResultView", sender: nil)
            
        }
    }
}

    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    

