//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zakee T on 8/25/21.
//M<--VVM  Model

import Foundation
//CardContent represents open to various
//private(set) = can see, not change
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var IndexOfOnlyOneFaceUpCard: Int?
    
    
    
    
    //calling mutationg will changs the func
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) , !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let possibleMatchIndex = IndexOfOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[possibleMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[possibleMatchIndex].isMatched = true
                
                }
                IndexOfOnlyOneFaceUpCard = nil
            } else {
                for index in cards.indices { //indices in place of "0..<cards.count"
                    cards[index].isFaceUp = false
                }
                IndexOfOnlyOneFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("Cardtest\(cards)")
        
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
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}


