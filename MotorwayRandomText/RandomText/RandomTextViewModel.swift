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
    
    private var configuration: Configuration
    
    internal init(configuration: RandomTextViewModel.Configuration? = nil) {
        self.configuration = configuration ?? .init()
    }
    
    func updateRandomText() {
        text = generateRandomText()
    }
    
    private func generateRandomText() -> String {
        return "Random!"
    }
    
}
