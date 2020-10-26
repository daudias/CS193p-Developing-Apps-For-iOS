//
//  EmojiMemoryGame.swift
//  Assignment 1
//
//  Created by Dias on 10/26/20.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var allEmojis: Array<String> = ["1", "2", "3", "4", "5"]
        let randomNumberOfPairCards = Int.random(in: 1...allEmojis.count)
        allEmojis.shuffle()
        let emojis = Array(allEmojis.prefix(upTo: randomNumberOfPairCards))
        return MemoryGame<String>(numberOfPairCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
        
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
