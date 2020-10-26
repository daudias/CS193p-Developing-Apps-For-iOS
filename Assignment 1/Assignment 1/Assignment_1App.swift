//
//  Assignment_1App.swift
//  Assignment 1
//
//  Created by Dias on 10/24/20.
//

import SwiftUI

@main
struct Assignment_1App: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
