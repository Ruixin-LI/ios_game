//
//  MemoryGame.swift
//  memorize
//
//  Created by Li Ruixin on 18/5/2022.
//
//model:data, logic

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{//struct free init set everything, lose when self define
    var cards: Array<Card>
    
    private var currentFaceUp: Int? {
        get{
            cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly
        }
        set{
            cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) }
        }
    }
    
    mutating func choose(_ card: Card){
//        if let cardIndex = indexOf(card){
        if let cardIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[cardIndex].isFaceUp,
           !cards[cardIndex].isMatched
        {
            if let currentFaceUpVal = currentFaceUp {
                if cards[currentFaceUpVal].context == cards[cardIndex].context{
                    cards[currentFaceUpVal].isMatched = true
                    cards[cardIndex].isMatched = true
                }
                cards[cardIndex].isFaceUp = true
            }
            else{
                currentFaceUp = cardIndex
            }
        }
    }
    
//    func indexOf(_ card : Card) -> Int?{
//        for i in 0..<cards.count{
//            if cards[i].id == card.id{
//                return i
//            }
//        }
//        return nil
//    }
    
    init(pairNum:Int, createCardContent:(Int) -> CardContent){
        cards = Array<Card>()
        //add 2*pairnum to the array
        for pairIndex in 0..<pairNum{
            let context = createCardContent(pairIndex)
            cards.append(Card(context: context, id: pairIndex*2))
            cards.append(Card(context: context, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable{
        //why nested? Namespace, s.t not conflict with others
        var isFaceUp = false
        var isMatched = false
        let context: CardContent//generic, do not care
        let id: Int
    }
}

extension Array{
    var oneAndOnly: Element?{
        if count == 1{
            return first
        }
        else{
            return nil
        }
    }
}
