//
//  MotorwayRandomTextTests.swift
//  MotorwayRandomTextTests
//
//  Created by Liam on 18/02/23.
//

import XCTest
@testable import MotorwayRandomText

final class MotorwayRandomTextTests: XCTestCase {
    
    var mockTextRepository: MockTextRepository!
    
    override func setUp() {
        mockTextRepository = MockTextRepository()
    }

    func createViewModel(words: [String], configuration: RandomTextViewModel.Configuration? = nil) -> RandomTextViewModel {
        mockTextRepository.wordsReturnValue = words
        return RandomTextViewModel(textRepository: mockTextRepository, configuration: configuration)
    }

}

extension MotorwayRandomTextTests {
    
    func testViewModelBasic() {
        let viewModel = createViewModel(words: ["word"], configuration: RandomTextViewModel.Configuration(maxCount: 10))
        
        viewModel.updateRandomText()
        XCTAssertTrue(mockTextRepository.wordsCalled)
        XCTAssertEqual(viewModel.text, "word word word word word word word word word word")
        XCTAssertEqual(viewModel.wordCount, 10)
    }
    
}
