//
//  Card.swift
//  Set
//
//  Created by Raj Gupta on 3/5/18.
//  Copyright © 2018 SoulfulMachine. All rights reserved.
//

import Foundation

enum CardNumber {
    case one,two,three
}

enum CardSymbol {
    case diamond,squiggle,oval
}

enum CardShading {
    case solid,striped,open
}

enum CardColor {
    case red,green,purple
}

struct SetCard {
    var number: CardNumber
    var symbol: CardSymbol
    var shading: CardShading
    var color: CardColor
}

extension SetCard: Equatable {
    static func == (lhs:SetCard,rhs:SetCard) -> Bool {
        return lhs.color == rhs.color && lhs.number == rhs.number && lhs.shading == rhs.shading && lhs.symbol == rhs.symbol
    }
}
