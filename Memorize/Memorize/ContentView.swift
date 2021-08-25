//
// ContentView.swift
// Memorize
//
//  Created by Zakee T on 8/20/21.
// M--V--VM  View

import SwiftUI

struct ContentView: View {
    var emojis = [ "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬",
                   "🇦🇷", "🇦🇲","🏴‍☠️", "🏁", "🚩",
                   "🇦🇫","🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸",]
    @State var emojiCount = 10
   
    var body: some View {
       //creating identifier for each emoji usind id: \.self
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65 ))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        cardView(content: emoji)
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
    @State var isFaceUp: Bool = true
    var content: String
    let shape = RoundedRectangle(cornerRadius: 20.0)
    var body: some View {
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text (content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
          isFaceUp = !isFaceUp
        }
    }
}
//









//only preview not codebase
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
        
       
    }
}

//"♈️", "♉️", "♊️", "♋️", "♌️", "♍️", "♎️", "♏️", "♐️", "♑️", "♒️", "♓️"
//"🚗", "🚕", "🚙", "🚌", "🚎", "🚓", "🚑", "🚒"
