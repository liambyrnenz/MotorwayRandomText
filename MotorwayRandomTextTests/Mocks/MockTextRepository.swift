//
//  MockTextRepository.swift
//  MotorwayRandomTextTests
//
//  Created by Liam on 18/02/23.
//

@testable import MotorwayRandomText

class MockTextRepository: TextRepositoryProtocol {
    
    // MARK: words()
    
    var wordsCalled: Bool = false
    var wordsReturnValue: [String]?
    
    func words() -> [String] {
        wordsCalled = true
        return wordsReturnValue!
    }
    
}
