//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Zakee T on 8/25/21.
//MV --->VM<--                     VIEW MODEL

import SwiftUI
//observableObject emits before the object has changed.
class EmojiMemoryGame: ObservableObject {
    typealias Card =  MemoryGame<String>.Card
   static let emojis = [ "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬","🇦🇷", "🇦🇲",
                         "🏴‍☠️", "🏁", "🚩","🇦🇫","🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸",]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsofCards: 4) { pairIndex in
            emojis[pairIndex]
            
        }
    }
    //@published will act in place of objectWillChange.send() - make reactive
   @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    // MARK: - Intent(s)
    //@published will act in place of objectWillChange.send() in func choose
    func choose(_ card: Card) {
        model.choose(card)
    }
}


