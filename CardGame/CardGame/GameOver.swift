//
//  GameOverViewController.swift
//  CardGame
//
//  Created by 呂晨汝 on 2021/8/2.
//

import UIKit

class GameOver: UIViewController {

    @IBOutlet weak var grade: UILabel!
    @IBOutlet weak var overTime: UILabel!

    var score:Int = 0
    var time:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        grade.text = String(score)
        
        if time>0{
            overTime.text = String(format: "%.0f", time)
        } else {
            overTime.text = String(30)
        }
        
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
