//
//  SecretProvider.swift
//  wordle
//
//  Created by 1234 on 07.06.2024.
//

import Foundation

final class SecretProvider {
    
    private static var secret = Secret.defaultSecret()
    
    func fetch(completion: @escaping (_ secret: Secret?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completion(SecretProvider.secret)
        }
    }
}
