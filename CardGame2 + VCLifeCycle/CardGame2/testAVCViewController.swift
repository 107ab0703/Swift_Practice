//
//  testAVCViewController.swift
//  CardGame2
//
//  Created by 呂晨汝 on 2021/8/4.
//

import UIKit

class testAVCViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var collectionview: UICollectionView!
    
    var stepCount = 0
    var counter = 30.0
    var timer = Timer()
    var score = 0
    var cards:Array<Card> = []
    var lastIndex:Int? //save last indexPath
    var lastId:String? //save last Id
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View A DidLoad")
        cards = random()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            print("View A WillAppear")
        }
        
    override func viewDidAppear(_ animated: Bool) {
        print("View A DidAppear")
    }
    
    override func viewDidLayoutSubviews() {
            print("View A DidLayoutSubviews")
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View A WillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("View A DidDisappear")
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        cell.poker.image = UIImage(named: cards[indexPath.row].stateView)
        cell.cardLabel.text = cards[indexPath.row].id
        cell.cardLabel.isHidden = cards[indexPath.row].state //如果state=true就藏
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let cardId = cards[indexPath.row].id
        cell.cardLabel.isHidden = false
        cell.poker.image = UIImage(named: "pokerNil")
        judge(index: indexPath.row, id: cardId)
    }
    
    //MARK: - Action
    
    @IBAction func Start(_ sender: UIButton) {
        collectionview.isUserInteractionEnabled = true
        startTimer()
        startBtn.backgroundColor = UIColor.systemGray4
        startBtn.isEnabled = false
    }
    
    @IBAction func Restart(_ sender: Any) {
        cards = random()
        resetValue()
        collectionview.reloadData()
    }
    
    //判斷翻牌蓋牌
    func judge(index: Int, id: String) {
        if index != lastIndex {
            stepCount += 1
            stepLabel.text = "步數：\(stepCount)"
            if stepCount % 2 == 1{
                lastIndex = index
                lastId = id
            } else {
                changeState(last: lastIndex!, now: index)
            }
        }
    }
    
    //    倒數計時
        func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [self] (timer) in
                self.counter = self.counter - 0.1
                if counter > 0 {    //counter為double，不會等於0.0
                    self.timeLabel.text = String(format: "%.1f", self.counter)
                } else {
                    gameOver()
                    resetValue()
                }

            })
        }
    
    //改變狀態
    func changeState(last:Int, now:Int){
        if cards[last].id == cards[now].id{
            score += 22
            scoreLabel.text = "總分：\(score)"
            cards[last].state = false
            cards[now].state = false
            cards[last].stateView = "pokerNil"
            cards[now].stateView = "pokerNil"
            if score == 110 {
                gameOver()
            }
        } else {
            cards[last].state = true
            cards[now].state = true
            cards[last].stateView = "poker"
            cards[now].stateView = "poker"
            delay(0.2, closure: { [self] in
                collectionview.reloadData()
            })
        }
    }
    
    //    遊戲結束時：時間到或分數110
        func gameOver(){
            let gameOverVC = storyboard?.instantiateViewController(identifier: "GameOver") as! GameOver
            gameOverVC.score = score
            gameOverVC.time = counter
            present(gameOverVC, animated: true, completion: nil)
            cards = random()
            resetValue()
            collectionview.reloadData()
        }
    
    //    所有設定歸零
        func resetValue(){
            stepCount = 0
            score = 0
            stepLabel.text = "步數：\(stepCount)"
            scoreLabel.text = "總分：\(score)"
            timeLabel.text = "30.0"
            startBtn.backgroundColor = UIColor.systemBlue
            startBtn.isEnabled = true
            timer.invalidate()
        }
    
    //延遲
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    //隨機洗牌
    func random() -> Array<Card>{
        collectionview.isUserInteractionEnabled = false
        var tempCard:Array<Card> = []
        let card1 = Card(id: "J", state: true)
        let card2 = Card(id: "J", state: true)
        let card3 = Card(id: "K", state: true)
        let card4 = Card(id: "K", state: true)
        let card5 = Card(id: "9", state: true)
        let card6 = Card(id: "9", state: true)
        let card7 = Card(id: "3", state: true)
        let card8 = Card(id: "3", state: true)
        let card9 = Card(id: "2", state: true)
        let card10 = Card(id: "2", state: true)
        let card = [card1,card2,card3,card4,card5,card6,card7,card8,card9,card10]
        tempCard.append(contentsOf: card)
        
        let random = Int.random(in: 0..<tempCard.count)
        var temp:Card
        for i in 0..<tempCard.count {
            temp = tempCard[random]
            tempCard[random] = tempCard[i]
            tempCard[i] = temp
        }
        return tempCard
    }



}
