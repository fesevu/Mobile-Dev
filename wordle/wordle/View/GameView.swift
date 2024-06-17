//
//  GameView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    enum GameState {
        case play, win, lose, waitingForNewSecret, loading
    }
    
    private let secretProvider = SecretProvider()
    private let lastSecretIdStore = LastSecretIdStore()
    
    @Published var secret: Secret
    @Published var keys: Keys
    @Published var gameState: GameState = .loading
    
    private let initionKeys: Keys
    
    init(secret: Secret, keys: Keys) {
        self.secret = secret
        self.initionKeys = keys
        self.keys = keys
    }
    
    func load() {
        gameState = .loading
        secretProvider.fetch { [weak self] in
            self?.handleNew(newSecret: $0)
        }
    }
    
    func onTap(_ letter: String) {
        guard letter.count == 1 else { return }
        guard secret.currentWordIndex < secret.words.count else { return }
        guard secret.currentLetterIndex < secret.words[secret.currentWordIndex].letters.count else { return }
        guard secret.words[secret.currentWordIndex].letters[secret.currentLetterIndex].title.isEmpty else { return }
        
        secret.words[secret.currentWordIndex].letters[secret.currentLetterIndex] = Letter(title: letter.uppercased(), highlight: .none)
        
        secret.currentLetterIndex = secret.currentLetterIndex + 1
        if secret.currentLetterIndex == secret.words[secret.currentWordIndex].letters.count {
            secret.currentLetterIndex = secret.words[secret.currentWordIndex].letters.count - 1
        }
    }
    
    func onEnter() {
        guard secret.currentWordIndex < secret.words.count else { return }
        
        lightUpChars()
        
        let word = secret.words[secret.currentWordIndex].letters.compactMap({ $0.title }).joined()
        
        if word == secret.answer {
            gameState = .win
            lastSecretIdStore.saveLastSecret(id: secret.id)
        } else if secret.currentWordIndex == secret.words.count - 1 {
            gameState = .lose
        } else {
            goToNextTry()
        }
    }
    
    func onRemove() {
        guard secret.currentWordIndex < secret.words.count else { return }
        guard secret.currentLetterIndex < secret.words[secret.currentWordIndex].letters.count else { return }
        
        if secret.words[secret.currentWordIndex].letters[secret.currentLetterIndex].title.isEmpty {
            secret.currentLetterIndex -= 1
            if secret.currentLetterIndex < 0 {
                secret.currentLetterIndex = 0
            } else {
                onRemove()
            }
        } else {
            secret.words[secret.currentWordIndex].letters[secret.currentLetterIndex] = Letter(title: "", highlight: .none)
        }
    }
    
    func onNextSecret() {
        load()
    }
    
    // MARK: private
    
    private func handleNew(newSecret: Secret?) {
        guard let newSecret = newSecret else { return }
        
        if lastSecretIdStore.getLastSecretId() == newSecret.id {
            gameState = .waitingForNewSecret
        } else {
            gameState = .play
            secret = newSecret
            keys = initionKeys
        }
    }
    
    private func lightUpChars() {
        var word = secret.words[secret.currentWordIndex]
        var newkKeys = keys
        
        for index in 0..<word.letters.count {
            guard let letter = word.letters[index].title.first else { return }
            
            if secret.answer.contains(letter) {
                let indexes = secret.answer.indexes(of: letter)
                if indexes.contains(index) { // Correct
                    word.letters[index].highlight = .correct
                    if let keyIndexes = keyIndexes(for: word.letters[index]) {
                        let newKey = Letter(title: keys.rows[keyIndexes.0].letters[keyIndexes.1].title, highlight: .correct)
                        newkKeys.rows[keyIndexes.0].letters[keyIndexes.1] = newKey
                    }
                } else { // Correct but on wrong place
                    word.letters[index].highlight = .wrongPlace
                    if let keyIndexes = keyIndexes(for: word.letters[index]) {
                        let newKey = Letter(title: keys.rows[keyIndexes.0].letters[keyIndexes.1].title, highlight: .wrongPlace)
                        newkKeys.rows[keyIndexes.0].letters[keyIndexes.1] = newKey
                    }
                }
            } else {
                word.letters[index].highlight = .wrong
                if let keyIndexes = keyIndexes(for: word.letters[index]) {
                    let newKey = Letter(title: keys.rows[keyIndexes.0].letters[keyIndexes.1].title, highlight: .wrong)
                    newkKeys.rows[keyIndexes.0].letters[keyIndexes.1] = newKey
                }
            }
        }
                
        secret.words[secret.currentWordIndex] = word
        keys = newkKeys
    }
    
    private func goToNextTry() {
        secret.words[secret.currentWordIndex].wrongAnswerCounter += 1
        secret.currentWordIndex = secret.currentWordIndex + 1
        secret.currentLetterIndex = 0
    }
    
    private func keyIndexes(for letter: Letter) -> (Int, Int)? {
        for rowIndex in keys.rows.indices {
            if keys.rows[rowIndex].letters.contains(where: { $0.title.lowercased() == letter.title.lowercased() }) {
                if let letterIndex = keys.rows[rowIndex].letters.firstIndex(where: { $0.title.lowercased() == letter.title.lowercased() }) {
                    return (rowIndex, letterIndex)
                }
            }
        }
        
        return nil
    }
}

extension GameViewModel {
    var waitingForNewSecretViewModel: WaitingForNewSecretViewModel {
        WaitingForNewSecretViewModel(unavailableUntil: secret.availableUntil)
    }
}

extension String {
    func indexes(of letter: Character) -> [Int] {
        var indexes: [Int] = []
        for index in 0..<self.count {
            if self[index] == letter {
                indexes.append(index)
            }
        }
        return indexes
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
