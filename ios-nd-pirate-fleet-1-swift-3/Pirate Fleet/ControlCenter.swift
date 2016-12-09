//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
    
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        // Write your code here!
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 0, y: 0), isVertical: true)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 2, y: 0), isVertical: false)
        let smallShip = Ship(length: 2, location: GridLocation(x: 2, y: 2), isVertical: true)
        let bigShip = Ship(length: 4, location: GridLocation(x: 4, y: 3), isVertical: false)
        let hugeShip = Ship(length: 5, location: GridLocation(x: 3, y: 5), isVertical: false)
        let firstMine = Mine(location: GridLocation(x: 4, y: 1), explosionText: "炸死你娃儿x")
        let secondMine = Mine(location: GridLocation(x: 1, y: 6), explosionText: "吃我一炸")
        
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(smallShip)
        human.addShipToGrid(bigShip)
        human.addShipToGrid(hugeShip)
        human.addMineToGrid(firstMine)
        human.addMineToGrid(secondMine)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        let enemyShipsSunk = 5 - gameStats.enemyShipsRemaining
        let sinkBonus = gameStats.sinkBonus
        let humanShipsRemaining = 5 - gameStats.humanShipsSunk
        let shipBonus = gameStats.shipBonus
        let numberOfGuesses = gameStats.numberOfMissesByHuman - gameStats.numberOfHitsOnEnemy
        let guessPenalty = gameStats.guessPenalty
        
        finalScore = (enemyShipsSunk * sinkBonus) + (humanShipsRemaining * shipBonus) - (numberOfGuesses * guessPenalty)
        
        return finalScore
    }
}
