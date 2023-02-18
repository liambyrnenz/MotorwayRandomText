//
//  Strings.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

/// Holds the copy used in the app in a single location for easy updating and maintaining.
struct Strings {
    struct RandomText {
        static let heading: String = "Random Text"
        static let description: String = "Create some random text using the button below. You can edit the generated text by typing in the field."
        
        struct Actions {
            static let generate: String = "Generate"
        }
        
        // copy in here is represented with closures, accepting arguments used to feed into the output strings
        struct Dynamic {
            static let wordCount: (Int) -> String = { value in
                let suffix = value == 1 ? "word" : "words"
                return "\(value) \(suffix)"
            }
        }
    }
}
