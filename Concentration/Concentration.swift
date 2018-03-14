//
//  Concentration.swift
//  Concentration
//
//  Created by Amanda Reinhard on 3/13/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        } else {
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card(identifier: <#Int#>)
            cards += [card, card]
        }
        // To-Do: Shuffle cards
    }
}
