//
// ContentView.swift
// Memorize
//
//  Created by Zakee T on 8/20/21.
// M--V--VM  View

import SwiftUI

struct ContentView: View {
    //@ObservedObject - something changed, rebuild body
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]){
                    ForEach(viewModel.cards) { card in
                        cardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
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
    let card: MemoryGame<String>.Card
    
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        
       
    }
}

//"♈️", "♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"
//"🚗", "🚕", "🚙", "🚌", "🚎", "🚓", "🚑", "🚒"
