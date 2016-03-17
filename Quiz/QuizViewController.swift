//
//  QuizViewController.swift
//  Quiz
//
//  Created by 天毛 瞬 on 2016/01/22.
//  Copyright © 2016年 天毛 瞬. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArry = [AnyObject]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var japaneseButton: UIButton!
    @IBOutlet var mathButton: UIButton!
    @IBOutlet var englishButton: UIButton!
    @IBOutlet var socialstudiesButton: UIButton!
    @IBOutlet var scienceButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
