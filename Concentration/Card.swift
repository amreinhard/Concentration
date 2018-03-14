//
//  Card.swift
//  Concentration
//
//  Created by Amanda Reinhard on 3/13/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
        
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
