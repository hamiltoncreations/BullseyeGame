//
//  RayWenderlichBullsEyeTests.swift
//  RayWenderlichBullsEyeTests
//
//  Created by Matthew Hamilton on 7/1/21.
//  Copyright © 2021 Matthew Hamilton. All rights reserved.
//

import XCTest
@testable import RayWenderlichBullsEye

class RayWenderlichBullsEyeTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testScorePositive() throws {
        
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() throws {
        
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }

}
