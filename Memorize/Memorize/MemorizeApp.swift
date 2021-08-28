//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Zakee T on 8/20/21.
//

import SwiftUI

@main //main program
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
