//
//  ConcentrationGame.swift
//  Concentration
//
//  Created by Алексей Глазунов on 01.07.2021.
//

import Foundation


struct ConcentrationGame {
    
    private(set) var cards = [Card]()
     
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceup {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceup = (index == newValue)
            }
            
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
    
            }else {
                                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "ConcentrationGame.init(\(numberOfPairsOfCards): must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
    
        
    }
    
    
    
}






