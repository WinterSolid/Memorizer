//
// ContentView.swift
// Memorize
//
//  Created by Zakee T on 8/20/21.
// M--V--VM  View

import SwiftUI

struct ContentView: View {
    let viewModel: EmojiMemoryGame
    
    var body: some View {
       //creating identifier for each emoji usind id: \.self
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]){
                    ForEach(viewModel.cards) { card in
                        cardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            
            .foregroundColor(.red)
        }
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
            } else {
                shape.fill()
            }
        }
    }
}
//









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
