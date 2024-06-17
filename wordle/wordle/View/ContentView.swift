//
//  ContentView.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel(secret: Secret.defaultSecret(), keys: Keys.defaultKeys())
    
    var body: some View {
        Group {
            ZStack {
                GeometryReader { geo in
                    if viewModel.gameState == .loading {
                        EmptyView()
                    } else {
                        board(width: geo.size.width)
                    }
                }
                
                switch viewModel.gameState {
                case .win:
                    WinMsgView(onNewGame: {
                                            viewModel.onNextSecret()
                                        })
                    .transparentBg()
                case .lose:
                    LoseMsgView(word: viewModel.secret.answer, onNewGame: {
                                            viewModel.onNextSecret()
                                        })
                    .transparentBg()
                case .waitingForNewSecret:
                                    WaitingForNewSecretView(
                                        viewModel: viewModel.waitingForNewSecretViewModel
                                    )
                                        .transparentBg()
                default: EmptyView()
                }
            }
        }
            .onAppear {
                viewModel.load()
            }
    }
    
    private func board(width: CGFloat) -> some View {
        VStack {
            PlayGroundView(words: viewModel.secret.words)
                .padding(.horizontal, 26)
            Spacer(minLength: 0)
            KeyboardView(keys: viewModel.keys,
                         width: width - 8,
                         onTap: viewModel.onTap,
                         onEnter: viewModel.onEnter,
                         onRemove: viewModel.onRemove)
                .padding(.horizontal, 4)
        }.padding(.vertical, 16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
