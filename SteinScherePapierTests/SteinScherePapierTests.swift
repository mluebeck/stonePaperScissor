//
//  SteinScissorPaperTests.swift
//  SteinScissorPaperTests
//
//  Created by Mario Rotz on 02.03.19.
//  Copyright © 2019 Mario Rotz. All rights reserved.
//

import XCTest
@testable import SteinScherePapier

class SteinScissorPaperTests: XCTestCase {
    
    var player1 : Player = Player.init(item: GameEngine.randomGameItem())
    var player2 : Player = Player.init(item: GameEngine.randomGameItem())
    var result : GameResult?
    
    override func setUp() {
        self.result = GameEngine.evaluate(player1: self.player1, player2: self.player2)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExamplePlayer() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let player1Item = GameEngine.randomGameItem()
        let player2Item = GameEngine.randomGameItem()
        XCTAssert(player1Item == .Stone || player1Item == .Scissor || player1Item == .Paper , "Player 1 item ")
        XCTAssert(player2Item == .Stone || player2Item == .Scissor || player2Item == .Paper , "Player 2 item")
    }

    func testPlayer1() {
        let player1 = Player.init(item: GameEngine.randomGameItem())
        XCTAssert(player1.selectedItem == .Stone || player1.selectedItem == .Scissor || player1.selectedItem == .Paper , "Player 1")
    }
    
    func testPlayer2() {
        let player2 = Player()
        player2.selectedItem = GameEngine.randomGameItem()
        XCTAssert(player2.selectedItem == .Stone || player2.selectedItem == .Scissor || player2.selectedItem == .Paper , "Player 1")
    }
    func testGamePlay() {
        for _ in 0...20 {
            gameplay()
        }
    }
    
    
    func gameplay() {
        self.player1 = Player.init(item: GameEngine.randomGameItem())
        self.player2 = Player.init(item: GameEngine.randomGameItem())
        self.result = GameEngine.evaluate(player1: self.player1, player2: self.player2)
        if (self.player1.selectedItem==GameItem.Stone && self.player2.selectedItem==GameItem.Paper)
        {
            XCTAssert(self.result==GameResult.Player2Win)
        }
        if (self.player1.selectedItem==GameItem.Stone && self.player2.selectedItem==GameItem.Paper){
            XCTAssert(self.result==GameResult.Player2Win)
        }
        if (self.player1.selectedItem==GameItem.Stone && self.player2.selectedItem==GameItem.Scissor){
            XCTAssert(self.result==GameResult.Player1Win)
        }
        if (self.player1.selectedItem==GameItem.Stone && self.player2.selectedItem==GameItem.Stone){
            XCTAssert(self.result==GameResult.Draw)
        }
        if (self.player1.selectedItem==GameItem.Paper && self.player2.selectedItem==GameItem.Paper){
            XCTAssert(self.result==GameResult.Draw)
        }
        if (self.player1.selectedItem==GameItem.Paper && self.player2.selectedItem==GameItem.Scissor)
        {
            XCTAssert(self.result==GameResult.Player2Win)
        }
        if (self.player1.selectedItem==GameItem.Paper && self.player2.selectedItem==GameItem.Stone)
        {
            XCTAssert(self.result==GameResult.Player1Win)
        }
        if (self.player1.selectedItem==GameItem.Scissor && self.player2.selectedItem==GameItem.Paper){
            XCTAssert(self.result==GameResult.Player1Win)
        }
        if (self.player1.selectedItem==GameItem.Scissor && self.player2.selectedItem==GameItem.Scissor){
            XCTAssert(self.result==GameResult.Draw)
        }
        if (self.player1.selectedItem==GameItem.Scissor && self.player2.selectedItem==GameItem.Stone){
            XCTAssert(self.result==GameResult.Player2Win)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
