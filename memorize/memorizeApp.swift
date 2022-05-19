//
//  memorizeApp.swift
//  memorize
//
//  Created by Li Ruixin on 16/5/2022.
//

import SwiftUI

@main
struct memorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
