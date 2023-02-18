//
//  RandomTextViewModel.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import Foundation

class RandomTextViewModel: ObservableObject {
    
    struct Configuration {
        var maxCount: Int = 50
    }
    
    @Published var text: String = ""
    
    private let textRepository: TextRepositoryProtocol
    
    private(set) var configuration: Configuration
    
    internal init(textRepository: TextRepositoryProtocol, configuration: Configuration? = nil) {
        self.textRepository = textRepository
        self.configuration = configuration ?? .init()
    }
    
    func updateRandomText() {
        text = generateRandomWords()
    }
    
    private func generateRandomWords() -> String {
        let words = textRepository.words()
        let randomWords = (0..<configuration.maxCount).map { _ in
            words.randomElement() ?? " " // if this fails for some reason, just fill the gap with a space
        }
        return randomWords.joined(separator: " ")
    }
    
}
