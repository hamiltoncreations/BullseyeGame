//
//  Game.swift
//  RayWenderlichBullsEye
//
//  Created by Matthew Hamilton on 6/30/21.
//  Copyright © 2021 Matthew Hamilton. All rights reserved.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        var bonus: Int = 0
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        }
        
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        
        target = Int.random(in: 1...100)
    }
}
