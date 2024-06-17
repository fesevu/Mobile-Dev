//
//  WaitingForNewSecretView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct WaitingForNewSecretView: View {
    
    @StateObject var viewModel: WaitingForNewSecretViewModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Новое слово будет\nдоступно через: ")
                .multilineTextAlignment(.center)
                .font(Font.title3)
                .padding(.top, 12)
                .padding(.horizontal, 16)
            Text(viewModel.availableAfter)
                .font(Font.system(size: 24, weight: .bold, design: .monospaced))
                .padding(.top, 12)
                .padding(.bottom, 20)
                .padding(.horizontal, 16)
        }
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color(white: 0, opacity: 0.5), radius: 8, x: 4, y: 4)
            .onAppear { viewModel.startCountDown() }
    }
}

struct WaitingForNewSecretView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingForNewSecretView(viewModel: WaitingForNewSecretViewModel(unavailableUntil: ""))
            .previewLayout(.sizeThatFits)
    }
}
