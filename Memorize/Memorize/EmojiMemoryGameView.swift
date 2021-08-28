//
// EmojiMemoryGameView.swift
// Memorize
//
//  Created by Zakee T on 8/20/21.
// M--V--VM                                 VIEW

import SwiftUI

struct EmojiMemoryGameView: View {
    //@ObservedObject - something changed, rebuild body
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]){
                    ForEach(game.cards) { card in
                        cardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            
            .foregroundColor(.red)
            .padding(.horizontal)
    }
}
//View of cards faceup/Down
struct cardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text (card.content).font(.largeTitle)
            }   else if card.isMatched {
                    shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}







//only preview not codebase
struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
        
       
    }
}

//"♈️", "♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"
//"🚗", "🚕", "🚙", "🚌", "🚎", "🚓", "🚑", "🚒"
