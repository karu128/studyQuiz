//
//  Quiz1ViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/02/05.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit

class Quiz1ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var JPtitle: UIImageView!
    @IBOutlet var JPQlabel: UILabel!
    @IBOutlet var quiztext: UITextView!
    @IBOutlet var JPkettei: UIButton!
    @IBOutlet var JPanswer: UILabel!
    @IBOutlet var nextbutton: UIButton!
    @IBOutlet var backbutton: UIButton!
    @IBOutlet var answer: UITextField!
    
    //正解数
    var correctAnswer: Int = 0
    //問題文を格納する配列
    var quizArray  = [[AnyObject]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

   
        answer.delegate = self
 
        //国語の問題文を書いていく
        
        var tmpArray = [[AnyObject]]()
        tmpArray.append(["日が照っているのに雨が降る天気のことを何の嫁入りと言うでしょう？","きつね"])
        tmpArray.append(["b","b"])
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
            
            JPanswer.text = "正解"
        }else{
            
            JPanswer.text = "不正解"
        }
        
        quizArray.removeAtIndex(0)
        
        if quizArray.count != 0 {
            
            quiztext.text = quizArray[0][0] as! String
            JPanswer.text = ""
            
        }else{
            
            performSegueWithIdentifier("toResultView", sender: nil)
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

}
