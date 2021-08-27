//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zakee T on 8/25/21.
//MV --->VM<---ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
   static let emojis = [ "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬",
                   "🇦🇷", "🇦🇲","🏴‍☠️", "🏁", "🚩",
                   "🇦🇫","🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsofCards: 4) { pairIndex in
            emojis[pairIndex]
            
        }
    }
    //@published will at as objectWillChange.send()
   @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}


