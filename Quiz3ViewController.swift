//
//  Quiz3ViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/02/05.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit

class Quiz3ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var SKtitle: UIImageView!
    
    @IBOutlet var SKQlabel: UILabel!
    
    @IBOutlet var quiztext: UITextView!
    
    @IBOutlet var answer: UITextField!
    
    @IBOutlet var SKkettei: UIButton!
    
    @IBOutlet var SKanswer: UILabel!
    
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
        //社会の問題文を書いていく
        tmpArray.append(["日本で一番高い山は富士山。では日本で一番長い川は一般的に何川と言うでしょう？","信濃川"])
        tmpArray.append(["賞の名前にもなっている、ダイナマイトを発明したことで知られる人物と言えば誰でしょう？","ノーベル"])
        tmpArray.append(["奈良時代に東大寺に大仏を作り、全国各地に国分寺をつくらせた天皇といえば？","聖武天皇"])
        tmpArray.append(["16世紀日本に初めて鉄砲が伝わったとされる島と言えば？","種子島"])
        tmpArray.append(["聖徳太子が定めた憲法は何条の憲法だったでしょう？","17条"])
        tmpArray.append(["日本の島の中で最南端にある島と言えば？","沖ノ鳥島"])
        tmpArray.append(["日本三大庭園の１つ「後楽園」がある都道府県はどこ？","岡山"])
        tmpArray.append(["世界三大美女の1人と言われ、酢に真珠を溶かして飲んだと伝えられるエジプトの女王は誰？","クレオパトラ"])
        tmpArray.append(["栄養価が高く、消化の良いことから「海のミルク」と呼ばれている、広島名物の海産物と言えば何？","かき"])
        tmpArray.append(["モルワイデ図法・メルカトル図法といったら何の描き方でしょう？","ちず"])
        tmpArray.append(["戦国武将伊達政宗の幼名は梵天丸（ぼんてんまる）。では徳川家康の幼名は？","竹千代"])
        tmpArray.append(["外国からの輸入品に対して課せられる税金のことを何税というでしょう？","関税"])
        tmpArray.append(["「おみずとり」で知られる二月堂のあるお寺と言えばどこ？","東大寺"])
        tmpArray.append(["明治１０年、「もうここらでよか」の言葉で自決した人はだれ？","西郷隆盛"])
        tmpArray.append(["戦国時代の武将で、「鳴かぬなら鳴かせてみようホトトギス」と詠われたのは誰？","豊臣秀吉"])
        tmpArray.append(["細川ガラシアの父で、「敵は本能寺にあり」といったとされる戦国武将といえばだれ？","明智光秀"])
        tmpArray.append(["自転車屋をやりながら飛行機の研究を行なったことで有名な兄弟と言えば何兄弟？","ライト兄弟"])
        tmpArray.append(["１８６９年に開通した世界最長の運河の名前は何でしょう？","スエズ運河"])
        tmpArray.append(["首都はベルン。１３世紀に建国されたウィリアムテルで知られるヨーロッパの中立国といえば？","スイス"])
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
            
            answer.text = "正解"
            //            AVAudioPlayerUtil.setValue(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bat-koukaon", ofType: "mp3")!));//ファイルセット（再生前事前準備）
            //            AVAudioPlayerUtil.play();
            
        }else{
            
            SKanswer.text = "不正解"
            //            AVAudioPlayerUtil.setValue(NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("out", ofType: "wav")!));//ファイルセット（再生前事前準備）
            //            AVAudioPlayerUtil.play();
        }
    }
    @IBAction func next(sender: AnyObject) {
        quizArray.removeAtIndex(0)
        
        if quizArray.count != 0 {
            
            quiztext.text = quizArray[0][0] as! String
            SKanswer.text = ""
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
    

