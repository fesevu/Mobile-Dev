//
//  LoseMasageView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct LoseMsgView: View {
    let word: String
    let onNewGame: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            Text(word)
                .font(Font.title)
                .padding(.top, 12)
            Text("Попытки угадать закончились(")
                .font(Font.subheadline)
                .padding(.horizontal, 16)
            Button(action: onNewGame) {
                Text("Продолжить")
                    .font(Font.headline)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 16)
            }
                .frame(height: 44)
                .background(Color.green)
                .cornerRadius(24)
                .padding(.top, 16)
                .padding(.bottom, 16)
        }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color(white: 0, opacity: 0.5), radius: 8, x: 4, y: 4)
    }
}

struct LoseMsgView_Previews: PreviewProvider {
    static var previews: some View {
        LoseMsgView(word: "Игра окончена", onNewGame: {})
            .previewLayout(.sizeThatFits)
    }
}
