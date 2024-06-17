//
//  Keys.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import Foundation

struct Keys {
    var rows: [KeysRow]

    static func initFrom(keysStrs: [String]) -> Keys {
        let rows = keysStrs.compactMap {
            KeysRow(letters: $0.compactMap { Letter(title: String($0), highlight: .none) })
        }
        
        return Keys(rows: rows)
    }
    
    static func defaultKeys() -> Keys {
        let keysStrs = [
            "йцукенгшщзхъ",
            "фывапролджэ",
            "ёячсмитьбю"
        ]
        
        return Keys.initFrom(keysStrs: keysStrs)
    }
}
