//
//  Card.swift
//  CardGame2
//
//  Created by 呂晨汝 on 2021/8/3.
//

import Foundation

class Card{
    
    var id:String
    var state:Bool = true
    var stateView:String = "poker"
    
    init(id:String, state:Bool = true, stateView:String = "poker") {
        self.id = id
    }
}
