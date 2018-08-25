//
//  ViewController.swift
//  Concentration
//
//  Created by Raj Gupta on 14/4/18.
//  Copyright © 2018 SoulfulMachine. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController
{
    @IBOutlet var backGroundView: UIView!
    
    var emojiChoices = ""
    
    var theme: (thmeName: String,themeElements: String)? {
        didSet {
            emojiChoices = theme?.themeElements ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    
    private lazy var game = Concentration()
    
    private var cardFaceUpColor = #colorLiteral(red: 0.9919172973, green: 0.9919172973, blue: 0.9919172973, alpha: 1)
    private var cardFaceDownColor = #colorLiteral(red: 0.02352941176, green: 0.8392156863, blue: 0.6274509804, alpha: 1)
    private var backGroundViewColor = #colorLiteral(red: 0.9919172973, green: 0.9919172973, blue: 0.9919172973, alpha: 1)
    private var labelColor = #colorLiteral(red: 0.937254902, green: 0.2784313725, blue: 0.4352941176, alpha: 1)
    
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            flipCountLabel.text = "Flips: \(game.flipCount)"
        }
    }
    
    @IBOutlet private weak var scoreLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration()
        updateViewFromModel()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in card buttons")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if theme == nil {
            theme = ("Foods","🥑🌭🌮🍱🍕🍙🍣🍉")
        }
        
        backGroundView.backgroundColor = backGroundViewColor
        flipCountLabel.textColor = labelColor
        scoreLabel.textColor = labelColor
        newGameButton.titleLabel?.textColor = labelColor
        
        updateViewFromModel()
    }
    
    private func updateViewFromModel() {
        
        if scoreLabel != nil {
            scoreLabel.text = "Score: \(game.score)"
        }
        if flipCountLabel != nil {
            flipCountLabel.text = "Flips: \(game.flipCount)"
        }
        
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    // Animate the Flip Up of the latest card that was touched
                    if index == game.buttonIndexToFlipUp {
                        UIView.transition(with: button, duration: 0.6, options: [.transitionFlipFromLeft], animations: {
                            button.setTitle(self.emoji (for: card), for: UIControlState.normal)
                            button.backgroundColor = self.cardFaceUpColor
                        })
                    }
                    else {
                        button.setTitle(self.emoji (for: card), for: UIControlState.normal)
                        button.backgroundColor = self.cardFaceUpColor
                    }
                }
                else {
                    if game.buttonIndicesToFlipDown.count > 2 && game.buttonIndicesToFlipDown.contains(index) {
                        // Animate flip down of previous 2 cards flipped up
                        UIView.transition(with: button, duration: 0.6, options: [.transitionFlipFromRight], animations: {
                            button.setTitle("", for: UIControlState.normal)
                            button.backgroundColor = card.isMatched ? self.backGroundViewColor : self.cardFaceDownColor
                        })
                    }
                    else {
                        button.setTitle("", for: UIControlState.normal)
                        button.backgroundColor = card.isMatched ? self.backGroundViewColor : self.cardFaceDownColor
                    }
                }
            }
            
            // Clear cards to flip down array
            if game.buttonIndicesToFlipDown.count > 2 {
                game.clearButtonsToFlipDown()
            }
        }
    }
    
    
    private var emoji =  [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if  emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
                emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    

}



extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}






