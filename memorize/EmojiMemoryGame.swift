//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Li Ruixin on 18/5/2022.
//
//viewModel: how the UI interact with model


import SwiftUI

//let pictures = ["⚽️", "🏀", "⚾️", "🎾","🥅","🏏", "🥹", "🙂']//pollute the global namespace

class EmojiMemoryGame:ObservableObject{
    typealias Card = MemoryGame<String>.Card
    //struct value type, class reference type. class pass reference, inherit, OOP; struct pass value, copy when changed, functional programming
    //class free init set nothing

    private static let pictures = ["⚽️", "🏀", "⚾️", "🎾","🥅","🏏", "🥹", "🙂"]
    //private, gatekeeper, protect the model from being access by someone else
    //private(set) others may read, can not write
    
    private static func CreateGame() -> MemoryGame<String>{
        MemoryGame<String>(pairNum: 8) { index in
                pictures[index]
            }
    }
    @Published private(set) var model = CreateGame()
    
    //TODO: - intent
    func choose(_ card : Card){
        model.choose(card)//publish to the world that something changes by @published
    }
}
