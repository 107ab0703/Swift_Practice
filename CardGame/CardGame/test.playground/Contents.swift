    var cardArray:Array<String>?
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
        cardArray = card
        print(card)
        
//            for i in 0..<card.count {
//                cardLabel[i].text = card[i]
//                cardLabel[i].isHidden = true
//                cardView[i].isEnabled = false
//            }
    }
    randomCard()

func random() -> Array<Any>{
    var card = ["J","K","9","3","J","K","9","3"]
    let index = Int.random(in: 0..<card.count)
    var temp:String
    for i in 0..<card.count{
        temp = card[index]
        card[index] = card[i]
        card[i] = temp
    }
    return card
}
random()

//viewcontroller


protocol ScoreDelegate {
    func calculateScore(score: Int, time: Double)
}

var scoreDelegate: ScoreDelegate!

////遊戲結束時：時間到或分數110
//func gameOver(){
//    let gameOverVC = storyboard?.instantiateViewController(identifier: "GameOver") as! GameOverViewController
//    present(gameOverVC, animated: true, completion: nil)
//}
//
//scoreDelegate.calculateScore(score: score, time: counter)
//dismiss(animated: true, completion: nil)
//
////Gameover
//
//scoreDelegate = self
//
//extension ViewController: ScoreDelegate {
//    func didTapChoice(image: UIImage, name: String, color: UIColor) {
//        mainImageView.image = image
//        nameLabel.text = name
//        view.backgroundColor = color
//    }
