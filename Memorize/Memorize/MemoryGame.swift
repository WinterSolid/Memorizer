//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zakee T on 8/25/21.
//M<--VVM  Model

import Foundation
//CardContent represents open to various
//private(set) = can see, not change
struct MemoryGame<CardContent> {
   private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
    
    }
    init(numberOfPairsofCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        //add numberOfPairsofCards * 2 to cards Array
        for pairIndex in 0..<numberOfPairsofCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card( content: content))
        }
        
    }
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}


