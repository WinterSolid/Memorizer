//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zakee T on 8/25/21.
//M<--VVM

import Foundation
//CardContent represents open to various
struct memoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
    
    }
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var cantent: CardContent
    }
    
}


