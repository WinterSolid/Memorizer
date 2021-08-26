//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Zakee T on 8/20/21.
//

import SwiftUI

@main //main program
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
