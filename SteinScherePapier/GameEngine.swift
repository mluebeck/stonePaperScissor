//
//  GameEngine.swift
//  SteinScherePapier
//
//  Created by Mario Rotz on 02.03.19.
//  Copyright © 2019 Mario Rotz. All rights reserved.
//

import UIKit

enum GameItem
{
    case Stone
    case Paper
    case Scissor
}

enum GameResult
{
    case Player1Win
    case Player2Win
    case Draw
}

class Player : NSObject
{
    var selectedItem : GameItem?
    
    override init() {
        super.init()
    }

    init(item:GameItem) {
        self.selectedItem = item
    }
    
    func initRandom() {
        self.selectedItem = GameEngine.randomGameItem()
    }
}

class GameEngine: NSObject
{
    static func randomGameItem() -> GameItem
    {
        let i = Int.random(in: 0...2)
        switch i
        {
        case 0:
            return .Stone
        case 1:
            return .Paper
        default:
            return .Scissor
        }
    }
    
    static func evaluate(player1:Player,player2:Player)->GameResult
    {
        if  let player1Item = player1.selectedItem,
            let player2Item = player2.selectedItem
        {
            switch player1Item
            {
            case .Stone:
                switch player2Item
                {
                case .Stone:
                    return .Draw
                case .Paper:
                    return .Player2Win
                case .Scissor:
                    return .Player1Win
                }
            case .Paper:
                switch player2Item
                {
                case .Stone:
                    return .Player1Win
                case .Paper:
                    return .Draw
                case .Scissor:
                    return .Player2Win
                }
            case .Scissor:
                switch player2Item
                {
                case .Stone:
                    return .Player2Win
                case .Paper:
                    return .Player1Win
                case .Scissor:
                    return .Draw
                }
            }
        }
        return .Draw
    }
}

