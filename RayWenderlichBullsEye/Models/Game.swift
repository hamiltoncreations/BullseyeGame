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
        return 100 - abs(target - sliderValue)
    }
}
