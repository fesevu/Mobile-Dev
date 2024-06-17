//
//  WordView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct WordView: View {
    let word: Word
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach((0..<word.letters.count), id: \.self) { index in
                LetterView(letter: word.letters[index])
            }
        }
            .modifier(Shake(animatableData: CGFloat(word.wrongAnswerCounter)))
            .animation(.default, value: word.wrongAnswerCounter)
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView(word: Word.previewsData)
    }
}

extension Word {
    static let previewsData = Word(letters: [
        Letter(title: "W", highlight: .wrong),
        Letter(title: "O", highlight: .correct),
        Letter(title: "R", highlight: .wrongPlace),
        Letter(title: "", highlight: .none),
        Letter(title: "", highlight: .none)
    ])
}
