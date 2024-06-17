//
//  Word.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

struct Word {
    var letters: [Letter] = []
    var wrongAnswerCounter: Int = 0
    
    //инициализатор пустого слова
    init(numberOfLetters: Int) {
        self.letters = Array(repeating: Letter(title: "", highlight: .none), count: numberOfLetters)
    }
    
    init(letters: [Letter]) {
        self.letters = letters
    }
}
