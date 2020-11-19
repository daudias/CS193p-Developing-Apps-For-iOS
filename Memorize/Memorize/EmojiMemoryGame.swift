//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Dias on 11/15/20.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
   
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊"]
        return MemoryGame<String>(numberOfPairCards: emojis.count) { pairIndex in emojis[pairIndex] }
    }

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)    
    }
    
    struct Theme {
        let name: String
        let color: Color
        let emojis: [String]
        var numberOfCardsToShow: Int
        
        init(name: String, color: Color, emojis: [String]) {
            self.name = name
            self.emojis = emojis
            self.color = color
            numberOfCardsToShow = Int.random(in: 1...emojis.count)
        }
        
        init(name: String, color: Color, emojis: [String], numberOfCardsToShow: Int) {
            self.init(name: name, color: color, emojis: emojis)
            self.numberOfCardsToShow = min(numberOfCardsToShow, emojis.count)
        }
    }
}
