//
//  BoardGameController.swift
//  Cards
//
//  Created by Victor Kimpel on 17.03.23.
//

import UIKit

class BoardGameController: UIViewController {
    
    // количество пар уникальных карточек
    var cardsPairsCounts = 8
    // сущность "Игра"
    lazy var game: Game = getNewGame()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
    }
    

  

}
