//
//  LastSecretIdStore.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import Foundation

final class LastSecretIdStore {
    
    private let key = "com.wordle.last.secret.id.key"
    private let userDefaults = UserDefaults.standard
    
    func saveLastSecret(id: String) {
        userDefaults.set(id, forKey: key)
    }
    
    func getLastSecretId() -> String? {
        userDefaults.string(forKey: key)
    }
}
