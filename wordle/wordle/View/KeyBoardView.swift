//
//  KeyBoardView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct KeyboardView: View {
    
    let keys: Keys
    let width: CGFloat
    let onTap: (_ letter: String) -> Void
    let onEnter: () -> Void
    let onRemove: () -> Void
        
    var body: some View {
        let width = letterSize(width: width, keys: keys)
        
        VStack(spacing: 4) {
            HStack {
                Spacer(minLength: 0)
                deleteButton
                    .frame(width: width * 2 + 4, height: width)
                    .background(Color(uiColor: .systemGroupedBackground))
                    .cornerRadius(4)
            }
            
            ForEach(keys.rows.indices, id: \.self) { rowIndex in
                HStack(spacing: 4) {
                    ForEach(keys.rows[rowIndex].letters.indices, id: \.self) { letterIndex in
                        letterView(keys.rows[rowIndex].letters[letterIndex], width: width)
                    }
                }
                    .frame(height: width)
            }
            
            doneButton
                .frame(width: width * 4 + 12, height: width)
                .background(Color(uiColor: .systemGroupedBackground))
                .cornerRadius(4)
        }
        .font(Font.system(size: width * 0.6, weight: .semibold, design: .rounded))
        .frame(alignment: .bottom)
    }
    
    private var deleteButton: some View {
        Button(action: onRemove) {
            HStack {
                Spacer(minLength: 0)
                Image(systemName: "delete.left")
                    .foregroundColor(Color.red)
                    .padding(.horizontal, 7)
            }
        }
    }
    
    private var doneButton: some View {
        Button(action: onEnter) {
            Text("ВВОД")
                .foregroundColor(Color(uiColor: .systemGreen))
        }
    }
    
    private func letterSize(width: CGFloat, keys: Keys) -> CGFloat {
        guard keys.rows.count <= 3 else { return .zero }
        
        guard let maxLettersRow = keys.rows.compactMap({ $0.letters.count }).sorted(by:>).first else { return .zero }
        
        let letterWidth = (width / CGFloat(maxLettersRow)) - 4
        
        return letterWidth
    }
    
    private func letterView(_ letter: Letter, width: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 4)
            .foregroundColor(letter.highlight.keyboardBg)
            .overlay {
                Text(letter.title)
            }
            .frame(width: width)
            .aspectRatio(1, contentMode: .fit)
            .onTapGesture {
                onTap(letter.title)
            }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(keys: Keys.defaultKeys(), width: UIScreen.main.bounds.width, onTap: {_ in}, onEnter: {}, onRemove: {})
    }
}

private extension LetterHighlight {
    var keyboardBg: Color {
        switch self {
        case .none: return Color(uiColor: .systemGroupedBackground)
        case .correct: return Color(uiColor: .systemGreen)
        case .wrongPlace: return Color(uiColor: .systemOrange)
        case .wrong: return Color(uiColor: .darkGray)
        }
    }
}
