//
//  Strings.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

struct Strings {
    struct RandomText {
        static let heading: String = "Random Text"
        static let description: String = "Create some random text using the button below. You can edit the generated text by typing in the field."
        
        struct Actions {
            static let generate: String = "Generate"
        }
        
        struct Dynamic {
            static let wordCount: (Int) -> String = { value in
                let suffix = value == 1 ? "word" : "words"
                return "\(value) \(suffix)"
            }
        }
    }
}
