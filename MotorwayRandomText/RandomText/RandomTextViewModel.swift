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
        // https://stackoverflow.com/questions/26845307/generate-random-alphanumeric-string-in-swift
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "
//        let regex = #"[A-Za-z0-9 ]"#) // TODO: is regex faster? Use measure (performance test)
        return String(
            (0..<configuration.maxCount).map { _ in
                letters.randomElement()! // TODO: should we force unwrap?
            }
        )
    }
    
}
