//
//  ViewController.swift
//  Concentration
//
//  Created by Amanda Reinhard on 3/11/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var game: Concentration?
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    }
    
    @IBAction func newGameButton(_ sender: Any) {
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
        flipCount = 0
        chosenTheme = nil
        updateViewFromModel()
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game?.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game?.cards[index]
            if (card?.isFaceUp)! {
                button.setTitle(emoji(for: card!), for:
                    UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = (card?.isMatched)! ? #colorLiteral(red: 1, green: 0.5492424461, blue: 0.06227509373, alpha: 0) : #colorLiteral(red: 1, green: 0.5492424461, blue: 0.06227509373, alpha: 1)
            }
        }
    
    }
    
    private var emojiChoices = [["🎃", "👻", "🦇", "🍎", "💀", "🧙‍♀️", "🧛‍♀️", "🧜‍♀️"],
                                ["☺️","😄","🙂","🙃","😋","😍","😘","😚"],
                                ["😺","😸","😻","😼","😽","🙀","😾","😹"],
                                ["👑","👚","👛","👒","🧣","👗","🎩","💼"],
                                ["🌻","🌼","🌸","🌺","🥀","🌹","💐","🌷"],
                                ["❤️","🧡","💛","💚","💙","💜","🖤","💖"]]
    
    private var emoji = [Card:String]()
    lazy var chosenTheme : [String]? = emojiChoices[emojiChoices.count.arc4random]
    
    private func emoji(for card: Card) -> String {
        if chosenTheme == nil {
            chosenTheme = emojiChoices[emojiChoices.count.arc4random]
        }
        
        if emoji[card] == nil, emojiChoices.count > 0 {
            let chosenIndex = chosenTheme?.count.arc4random
            let chosenEmoji = chosenTheme![chosenIndex!]
            emoji[card] = chosenEmoji
            chosenTheme?.remove(at: chosenIndex!)
        }
        return emoji[card] ?? "?"
    }

}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
        
    }
}

