//
//  Secret.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import Foundation

struct Secret {
    var words: [Word]
    var currentWordIndex: Int
    var currentLetterIndex: Int
    
    let id: String
    let answer: String
    let availableUntil: String
}

extension Secret {
    static func create(for answer: String, availableUntil: String) -> Secret {
    //static func create(for answer: String) -> Secret {
        return Secret(
            words: Array(repeating: Word(numberOfLetters: answer.count), count: answer.count + 1),
            currentWordIndex: 0,
            currentLetterIndex: 0,
            id: answer,
            answer: answer,
            availableUntil: availableUntil
        )
    }
    
    static func defaultSecret() -> Secret {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let availableUntil = dateFormatter.string(from: Date()) + " 23:59"
        
        let words = ["МАГНИТ", "ЗАБАВА", "ОБЛАКО", "МОЛОКО", "ДРУЗЬЯ", "ЛЕЗВИЕ"]
        
        return create(for: words.randomElement()!, availableUntil: availableUntil)
    }
}
