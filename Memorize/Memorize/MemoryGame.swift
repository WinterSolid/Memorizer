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
    //calling mutationg will changs the func
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("Cardtest\(cards)")
    }
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
}
        
    
    init(numberOfPairsofCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        //add numberOfPairsofCards * 2 to cards Array
        for pairIndex in 0..<numberOfPairsofCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card( content: content, id: pairIndex * 2 + 1))
        }
        
    }
    struct Card: Identifiable {
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}


