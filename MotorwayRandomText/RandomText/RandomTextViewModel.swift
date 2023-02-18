//
//  RandomTextViewModel.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import Foundation

class RandomTextViewModel: ObservableObject {
    
    struct Configuration {
        var characters: [Character] = [Character]("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ")
        var maxCount: Int = 50
    }
    
    @Published var text: String = ""
    
    private var configuration: Configuration
    
    internal init(configuration: RandomTextViewModel.Configuration? = nil) {
        self.configuration = configuration ?? .init()
    }
    
    func updateRandomText() {
        text = generateRandomText()
    }
    
    private func generateRandomText() -> String {
        return String(
            (0..<configuration.maxCount).map { _ in
                configuration.characters.randomElement() ?? " " // if this fails for some reason, just fill the gap with a space
            }
        )
    }
    
}
