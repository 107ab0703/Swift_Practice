//
//  ViewController.swift
//  CardGame
//
//  Created by 呂晨汝 on 2021/7/29.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet var cardView: [CardView]!
    @IBOutlet var cardLabel: [UILabel]!
    @IBOutlet weak var StartBtn: UIButton!
    var counter = 30.0
    var timer = Timer()
    var score = 0
    var stepCount = 0
    var click = Click()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomCard()
    }
    

    @IBAction func Start(_ sender: UIButton) {
        startTimer()
        for i in 0..<cardLabel.count {
            cardView[i].isEnabled = true
        }
        StartBtn.backgroundColor = UIColor.systemGray4
        StartBtn.isEnabled = false
    }
    
    @IBAction func CardClick(_ sender: CardView) {
        stepCount += 1
        stepLabel.text = "步數：\(stepCount)"
        if stepCount % 2 == 1 {
//          翻牌
            print("1->tag:\(sender.tag)")
            cardLabel[sender.tag].isHidden = false
            cardView[sender.tag].backgroundColor = UIColor.systemGray6
//          把點選的字跟tag傳到Click
            click.first = cardLabel[sender.tag].text!
            click.tag1 = sender.tag
            print("click.first:\(click.first)")
            print("click.tag1:\(click.tag1)")
        } else {
            print("2->tag:\(sender.tag)")
//          把點選的字跟tag傳到Click
            click.second = cardLabel[sender.tag].text!
            click.tag2 = sender.tag
            print("click.second:\(click.second)")
            print("click.tag2:\(click.tag2)")
//          判斷
            judge(first: click.first, second:  click.second)
        }
    }
    
    @IBAction func Restart(_ sender: UIButton) {
        randomCard()
        resetValue()
    }
    
    
//    倒數計時
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] (timer) in
            self.counter = self.counter - 0.1
            if counter > 0 {    //counter為double，不會等於0.0
                self.timeLabel.text = "倒數 : \(String(format: "%.1f", self.counter))"
            } else {
                gameOver()
                resetValue()
            }

        })
    }
    
//  遊戲前：洗牌+蓋牌
    func randomCard(){
        var card = ["J","K","9","3","2","J","K","9","3","2"]
        let random = Int.random(in: 0..<card.count)
        var temp:String
        for i in 0..<card.count {
            temp = card[random]
            card[random] = card[i]
            card[i] = temp
        }
        for i in 0..<cardLabel.count {
            cardLabel[i].text = card[i]
            cardLabel[i].isHidden = true
            cardView[i].backgroundColor = UIColor.lightGray
            cardView[i].layer.cornerRadius = 15
            cardView[i].isEnabled = false
        }
    }
//    所有設定歸零
    func resetValue(){
        stepCount = 0
        score = 0
        stepLabel.text = "步數：\(stepCount)"
        scoreLabel.text = "總分：\(score)"
        timeLabel.text = "倒數 : 30.0"
        StartBtn.backgroundColor = UIColor.systemBlue
        StartBtn.isEnabled = true
        timer.invalidate()
    }
    
//    判斷是否相同
    func judge(first: String, second: String){
        if first == second {
            score += 22
            cardAction(color: UIColor.systemGray6, bool: false)
            scoreLabel.text = "總分：\(score)"
        } else {
            cardAction(color: UIColor.lightGray, bool: true)
        }
    }
//    翻卡牌或蓋卡牌
    func cardAction(color: UIColor, bool: Bool){
        cardLabel[click.tag1].isHidden = bool
        cardLabel[click.tag2].isHidden = bool
        cardView[click.tag1].backgroundColor = color
        cardView[click.tag2].backgroundColor = color
        if score == 110 {
            gameOver()
        }
    }
    
//    遊戲結束時：時間到或分數110
    func gameOver(){
        let gameOverVC = storyboard?.instantiateViewController(identifier: "GameOver") as! GameOver
        gameOverVC.score = score
        gameOverVC.time = counter
        present(gameOverVC, animated: true, completion: nil)
        resetValue()
        randomCard()
    }

    
}


