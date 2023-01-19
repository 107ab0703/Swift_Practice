//
//  GameOver.swift
//  CardGame2
//
//  Created by 呂晨汝 on 2021/8/5.
//

import UIKit

class GameOver: UIViewController {
    
    @IBOutlet weak var endScore: UILabel!
    @IBOutlet weak var overTime: UILabel!
    
    var score:Int = 0
    var time:Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View B DidLoad")
        endScore.text = String(score)
        if time>0{
            overTime.text = String(format: "%.0f", time)
        } else {
            overTime.text = String(30)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View B WillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View B DidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View B WillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("View B DidDisappear")
    }
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
