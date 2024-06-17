//
//  PlayGroundView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct PlayGroundView: View {
    let words: [Word]
    
    var body: some View {
        //вертикальный стек
        VStack(spacing: 6) {
            ForEach((0...5), id: \.self) { index in
                WordView(word: words[index])
            }
        }
    }
}

struct PlayGroundView_Previews: PreviewProvider {
    static var previews: some View {
        PlayGroundView(words: Array(repeating: Word.previewsData, count: 6))
    }
}
