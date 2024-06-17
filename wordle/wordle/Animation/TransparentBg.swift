//
//  TransparentBg.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct TransparentBg: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color(white: 0, opacity: 0.5).ignoresSafeArea()
            content
        }
    }
}

extension View {
    func transparentBg() -> some View {
        modifier(TransparentBg())
    }
}
