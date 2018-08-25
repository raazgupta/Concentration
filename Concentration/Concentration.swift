//
//  Concentration.swift
//  Concentration
//
//  Created by Raj Gupta on 18/4/18.
//  Copyright © 2018 SoulfulMachine. All rights reserved.
//

import Foundation

struct Concentration
{
    
    private(set) var cards = [Card]()
    private(set) var buttonIndexToFlipUp: Int?
    private(set) var buttonIndicesToFlipDown = [Int]()
    var score = 0
    var flipCount = 0
    private var numberOfPairsOfCards = 8
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
            
        }
    }
    
    mutating func clearButtonsToFlipDown(){
        // Remove the first 2 cards as they have been flipped down and keep the last card in the array
        if buttonIndicesToFlipDown.count > 2 {
            buttonIndicesToFlipDown.removeFirst(2)
        }
    }
    
    mutating func chooseCard(at index:Int) {

        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)): choose index not in cards")
        
        flipCount += 1
        
        if !cards[index].isMatched {
            
            buttonIndexToFlipUp = index
            buttonIndicesToFlipDown.append(index)
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                else {
                    if cards[index].isSeen == true {
                        score -= 1
                    }
                    if cards[matchIndex].isSeen == true {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                
                cards[index].isSeen = true
                cards[matchIndex].isSeen = true
                
                
                
            }
            else {
                // either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init() {
        
        assert(numberOfPairsOfCards > 0,"Concentration.init(\(numberOfPairsOfCards)): Must be greater than 0")
        
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        //Shuffle the cards
        var shuffledCards = [Card]()
        while cards.count > 0 {
            let foundIndex = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCards.append(cards.remove(at: foundIndex))
        }
        cards = shuffledCards
    }
    
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
    
}

