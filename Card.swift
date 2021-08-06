//
//  Card.swift
//  Concentration
//
//  Created by Алексей Глазунов on 01.07.2021.
//

import Foundation


struct Card: Hashable {
 
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceup = false
    var isMatched = false
    private var identifier: Int
    
  private static var identifierNumber = 0
    
   private static func identifierGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}
