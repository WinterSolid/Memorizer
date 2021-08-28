//
//  MemoryGame.swift
//  Memorize
//
//  Created by Zakee T on 8/25/21.
//M<--VVM                               MODEL

import Foundation
//CardContent represents open to various
//private(set) = can see, not change
struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var IndexOfOnlyOneFaceUpCard: Int? {
    get {
        var FaceUpCardIndices = [Int] ()
        for index in cards.indices {
            if cards[index].isFaceUp {
                FaceUpCardIndices.append(index)
            }
        }
        if FaceUpCardIndices.count == 1 {
            return FaceUpCardIndices.first
        } else {
            return nil
        }
    }
    set {
        for index in cards.indices { //indices in place of "0..<cards.count"
            if index != newValue {
            cards[index].isFaceUp = false
            } else {
                cards[index].isFaceUp = true
                }
            }
        
    }
}
    
    
    
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
                cards[chosenIndex].isFaceUp = true
            } else {
                
                IndexOfOnlyOneFaceUpCard = chosenIndex
            }
           
        }
        
    }
        
    
    init(numberOfPairsofCards: Int, createCardContent: (Int) -> CardContent){
        cards = []   //Array<Card>()
        //add numberOfPairsofCards * 2 to cards Array
        for pairIndex in 0..<numberOfPairsofCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card( content: content, id: pairIndex * 2 + 1))
        }
        
    }
    struct Card: Identifiable {
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
    
}


