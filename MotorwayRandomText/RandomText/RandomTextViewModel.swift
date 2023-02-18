//
//  RandomTextViewModel.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import Foundation

class RandomTextViewModel: ObservableObject {
    
    /// A struct used to hold configuration options for the view model.
    struct Configuration {
        var maxCount: Int = 50
    }
    
    /// The text that is displayed in the text area on screen. The view model
    /// updates this property upon random word generation and the view also
    /// updates this property when the user performs edits in the text area.
    @Published var text: String = ""
    
    /// The number of words currently in the ``RandomTextViewModel/text`` property.
    var wordCount: Int {
        text.split(separator: " ").count
    }
    
    private let textRepository: TextRepositoryProtocol
    
    private(set) var configuration: Configuration
    
    /// - Parameters:
    ///   - textRepository: repository to fetch text data from
    ///   - configuration: configuration for the view model (if none is provided, a default
    ///   will be used instead.)
    internal init(textRepository: TextRepositoryProtocol, configuration: Configuration? = nil) {
        self.textRepository = textRepository
        self.configuration = configuration ?? .init()
    }
    
    /// Updates the text field with random words. The number of words is controlled by the
    /// configuration set into this view model.
    func updateRandomText() {
        text = generateRandomWords()
    }
    
    private func generateRandomWords() -> String {
        let words = textRepository.words()
        if words.isEmpty {
            return "" // do this, otherwise we get a string of spaces in the following code
        }
        
        let randomWords = (0..<configuration.maxCount).map { _ in
            words.randomElement() ?? " " // if this fails for some reason, just fill the gap with a space
        }
        
        return randomWords.joined(separator: " ")
    }
    
}
