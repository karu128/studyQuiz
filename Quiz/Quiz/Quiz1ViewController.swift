//
//  Quiz1ViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/02/05.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit



class Quiz1ViewController: UIViewController, UITextFieldDelegate {
    
    //問題文を格納する配列
    var quizArray = [[AnyObject]]()
    
    //正解数
    var correctAnswer: Int = 0
    //問題数
    var quizCount: Int = 0
    //各パーツの宣言
    @IBOutlet var JPtitle: UIImageView!
    @IBOutlet var JPQlabel: UILabel!
    @IBOutlet var quiztext: UITextView!
    @IBOutlet var JPkettei: UIButton!
    @IBOutlet var JPanswer: UILabel!
    @IBOutlet var nextbutton: UIButton!
    @IBOutlet var backbutton: UIButton!
    @IBOutlet var answer: UITextField!
    
    //NSUserDefault
    var saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //NSUserDefault
        correctAnswer = saveData.objectForKey("Answer") as? Int
        quizCount = saveData.objectForKey("Quiz") as? Int
        saveData.synchronize()
        answer.delegate = self
        
        var tmpArray = [[AnyObject]]()
        //    textfield.delegate = self
        tmpArray.append(["四国には４つの県があります。高知県、愛媛県、香川県とあと１つはどこでしょう？","徳島県"])
        tmpArray.append(["日本の県名で漢数字が入っている県が２つあります。１つは三重県。ではもう１つは？(「京」も数の単位ですが、東京、京都は県で                                                                                はなく都・府なので×)","千葉"])
        //        tmpArray.append(["あまり見ることがない２０００円札。この２０００円札に描かれている肖像画は誰の肖像画でしょうか？","紫式部"])
        //        tmpArray.append(["日本の県庁所在地の中で唯一ひらがなが使われているのは何県でしょう？","埼玉"])
        //        tmpArray.append(["1918年に発生した「米騒動」が全国で最初に起こった都道府県はどこ？","富山県"])
        //        tmpArray.append(["日本の国の鳥、いわゆる「国鳥」といえば何でしょう？","キジ"])
        //        tmpArray.append(["借金などで身動きが取れないことをたとえて「何が回らない」と言うでしょう？","首"])
        //        tmpArray.append(["１９８１年に全国統一された「納豆の日」は何月何日でしょう？","7月10日"])
        //        tmpArray.append(["昔話「ネズミの嫁入り」で雲が俺より強いと言ったのは風。では風が俺よりも強いと言ったものは何？","壁"])
        //        tmpArray.append(["獲物をみんなで分けるのは山分け。では新しい分野を開拓した人は何分けというでしょう？","草分け"])
        //        tmpArray.append(["５月の空に舞うのは鯉のぼり。では人気や評判が急上昇するのは何のぼりという？","うなぎのぼり"])
        //        tmpArray.append(["中国料理の中で、漢字で書くと雲を呑む（のむ）と書くものは何？","ワンタン",])
        //        tmpArray.append(["別名を「サクラウオ」ともいう氷に穴を開けて釣ることで知られる魚は何？","ワカサギ"])
        //        tmpArray.append(["ことわざで「川流れ」したり、「なまずを押さえ」たり、「駒」が出てくるウリ科の植物は？","ひょうたん"])
        //        tmpArray.append(["大根の切り口に赤唐辛子を差し込んですり下ろしたものを秋の紅葉になぞらえて何という？","もみじおろし"])
        //        tmpArray.append(["ドイツ語で土地という意味をもつ、スキー場の斜面のことをカタカナ４文字で何という？","ゲレンデ"])
        //        tmpArray.append(["地域によっては「おどし」「そめ」「そうず」などと呼ばれている田んぼに立っている物と言えば何？","かかし"])
        //        tmpArray.append(["都道府県の面積で１番広いのは北海道。では２番目はどこ？","岩手県"])
        //        tmpArray.append(["じゃまなもののたとえで足の裏につくのは飯粒。では目の上にできるのはなに？","たんこぶ"])
        //        tmpArray.append(["１つの行動で２つの利益をあげるたとえ。「一石」といえば「二鳥」。では「一挙」といえば何？","両得"])
        //        tmpArray.append(["失敗したときのたとえ。木から落ちるのはサル。筆を誤るのは弘法大師。では川に流されるのは何？","カッパ"])
        //        tmpArray.append(["痛いときは目から、恥ずかしいときは顔から出るのものと言えば何？","火"])
        //        tmpArray.append(["せっぱつまった場面は土壇場（どたんば）。ではここぞという大事な場面は何場？","正念場"])
        //        tmpArray.append(["人がまったくいない事をある動物にたとえて「何の子一匹いない」というでしょう？","猫の子"])
        //        tmpArray.append(["物事が正反対のたとえで雪といえば墨（すみ）。では月といえば何？","すっぽん"])
        //        tmpArray.append(["現在の国民の祝日の中で、一年の最後にある祝日は何？","天皇誕生日"])
        //        tmpArray.append(["日本の祝日の中で唯一２月にある祝日は何？","建国記念日"])
        //        tmpArray.append(["「自然にしたしむとともにその恩恵に感謝し、豊かな心をはぐくむ」という趣旨がある４月２９日の祝日は何？","みどりの日"])
        //        tmpArray.append(["1946年に日本国憲法が公布された日であり、日本国憲法が平和と文化を重視しているということで２年後に定められた祝日は何？","文化の日"])
        //        tmpArray.append(["成人の日、体育の日、海の日、敬老の日のように祝日を月曜日にすることで連休を多くする制度を何というでしょう？","ハッピーマンデー制度"])
        //        tmpArray.append(["日本の祝日の中で１年の一番はじめにある祝日は何？","元日"])
        
        
        while (tmpArray.count > 0) {
            let index =  Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        
        choiceQuiz()
 
    }
    
    func choiceQuiz() {
        quiztext.text = quizArray[0][0] as! String
        //        choiceButton1.setTitle((quizArray[0][1] as? String), forState: .Normal)
        //        choiceButton2.setTitle((quizArray[0][2] as? String), forState: .Normal)
        //        choiceButton3.setTitle((quizArray[0][3] as? String), forState: .Normal)
    }
    
    //    @IBAction func choiceAnswer(sender: UIButton) {
    //        if quizArray[0][1] as! Int == sender.tag {
    //
    //
    //            correctAnswer++
    //        }
    //
    //
    //        quizArray.removeAtIndex(0)
    //
    //
    //        if quizArray.count == 0 {
    //            perfromSegueToResult()
    //        } else {
    //            choiceQuiz()
    //        }
    //    }
    
    
    
    //改行ボタンが押された際に呼ばれるデリゲードメソッド
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func `return`(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    
    @IBAction func answer(sender: AnyObject) {
        
        let inputText = answer.text
        
        //NSUserDefaultに書き込み
        saveData.setObject(correctAnswer, forKey: "Answer")
        saveData.setObject(quizCount, forKey: "Quiz")
        saveData.synchronize()
        
        if inputText! == quizArray[0][1] as! String{
            
            JPanswer.text = "正解"
            JPanswer.textColor = UIColor.redColor()
            correctAnswer = correctAnswer + 1
            quizCount = quizCount + 1
            NSLog("correctAnswerは%dだ" , correctAnswer)
        }else{
            
            JPanswer.text = "不正解"
            JPanswer.textColor = UIColor.blueColor()
 
        }
    }
    @IBAction func next(sender: AnyObject) {
//        NSLog("correctAnswerは%dだ" , correctAnswer)
        quizArray.removeAtIndex(0)
        //NSUserDefaultから値を取り出す
        let correctAnswer = saveData.objectForKey("Answer") as? Int
        let quizCount = saveData.objectForKey("Quiz") as? Int
        saveData.synchronize()
        
        if quizArray.count != 0 {
            
            quiztext.text = quizArray[0][0] as! String
            JPanswer.text = ""
            answer.text = ""
            
        }else{
            
            performSegueWithIdentifier("toResultView", sender: nil)
            
        
      //セグエが選ばれた時に呼ばれるメソッド
     
         func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
            if (segue.identifier == "toResultView") {
                
                
                let resultView = segue.destinationViewController as! ResultViewController
                resultView.questionnumber = self.quizCount
               
            }
        }
        
    }
    
}
}