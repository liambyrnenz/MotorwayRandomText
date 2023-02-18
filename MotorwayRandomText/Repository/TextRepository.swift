//
//  TextRepository.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import Foundation

protocol TextRepositoryProtocol {
    
    /// Retrieves a source list of words for the app to generate random choices from.
    func words() -> [String]
    
}

class TextRepository: Repository, TextRepositoryProtocol {
    
    func words() -> [String] {
        let corporaWords: CorporaWords = decode(from: "words") // get from file in Resources directory
        return corporaWords.commonWords
    }
    
}
