
//
//  Quiz5ViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/02/05.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit

class Quiz5ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var SCtitle: UIImageView!
    @IBOutlet var SCQlabel: UILabel!
    @IBOutlet var quiztext: UITextView!
    
    @IBOutlet var answer: UITextField!
    
    @IBOutlet var SCkettei: UIButton!
    
    @IBOutlet var SCanswer: UILabel!
    
    @IBOutlet var back: UIButton!
    
    @IBOutlet var next: UIButton!
    
    //正解数
    var correctAnswer: Int = 0
    //問題文を格納する配列
    var quizArray  = [[AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        answer.delegate = self
        
        //国語の問題文を書いていく
        
        var tmpArray = [[AnyObject]]()
        //理科の問題文を書いていく
        tmpArray.append(["じゃがいもなどにデンプンが含まれているかどうか調べるときに使う、青紫色に反応する液体とはなんでしょう？","ヨウ素液"])
        tmpArray.append(["顕微鏡の観察用の標本のことをカタカナ6文字でなんと言うでしょう？","プレパラート"])
        tmpArray.append(["1年の内、一番昼の時間が長い日をなんと言うでしょう？","夏至"])
        tmpArray.append(["地球の成層圏で層をなし、紫外線をさえぎる働きをする、フロンガスで破壊される物質といえば？","オゾン"])
        tmpArray.append(["夏の大三角の1等星はデネブ、アルタイルと後一つは何でしょう？カタカナ2文字です。","ペガ"])
        tmpArray.append(["冷やす目的やテレビの演出でよく使われる、二酸化炭素を冷やして凍らせたものを何と言うでしょう？","ドライアイス"])
        tmpArray.append(["てこの原理で３つの力と言えば「力点」「支点」とあと一つは何？","作用点"])
        tmpArray.append(["電池や体温計に使われることがある、常温の時に液体である唯一の金属といえば何？","水銀"])
        tmpArray.append(["環境にやさしい商品についているエコマーク。このマークで両腕に抱かれている星は何？","地球"])
        tmpArray.append(["アメリカの学者「リヒター」が定義した記号Ｍで表わされる地震の規模を表す単位は？","マグニチュード"])
        tmpArray.append(["惑星のまわりを回る星を衛星と言いますが、太陽系の惑星で衛星を持たないのは金星ともう一つは？","水星"])
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
            
            SCanswer.text = "正解"
            //            AVAudioPlayerUtil.setValue(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bat-koukaon", ofType: "mp3")!));//ファイルセット（再生前事前準備）
            //            AVAudioPlayerUtil.play();
            
        }else{
            
            SCanswer.text = "不正解"
            //            AVAudioPlayerUtil.setValue(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("out", ofType: "wav")!));//ファイルセット（再生前事前準備）
            //            AVAudioPlayerUtil.play();
        }
    }
    @IBAction func next(sender: AnyObject) {
        quizArray.removeAtIndex(0)
        
        if quizArray.count != 0 {
            
            quiztext.text = quizArray[0][0] as! String
            SCanswer.text = ""
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
    


