//
//  LatterView.swift
//  wordle
//
//  Created by 1234 on 06.06.2024.
//

import SwiftUI

struct LetterView: View {
    let letter: Letter
        
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(letter.highlight.bgColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(letter.highlight.borderColor, lineWidth: 3)
                )
            
            Text(letter.title)
                .foregroundColor(Color.black)
        }
            .aspectRatio(1, contentMode: .fit)
    }
}

//отображение буквы с подсветкой
struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView(letter: Letter(title: "F", highlight: .correct))
            .previewLayout(PreviewLayout.fixed(width: 60, height: 60))
        LetterView(letter: Letter(title: "F", highlight: .wrong))
            .previewLayout(PreviewLayout.fixed(width: 60, height: 60))
        LetterView(letter: Letter(title: "F", highlight: .wrongPlace))
            .previewLayout(PreviewLayout.fixed(width: 60, height: 60))
        LetterView(letter: Letter(title: "", highlight: .none))
            .previewLayout(PreviewLayout.fixed(width: 60, height: 60))
    }
}

private extension LetterHighlight {
    var bgColor: Color {
        switch self {
        case .none: return .clear
        case .wrong: return Color(uiColor: .darkGray)
        case .correct: return Color(uiColor: .systemGreen)
        case .wrongPlace: return Color(uiColor: .systemOrange)
        }
    }
    
    var borderColor: Color {
        self == .none ? Color(uiColor: .lightGray) : .clear
    }
}
