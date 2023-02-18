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
    
    /// - Parameters:
    ///   - words: mocked words list that the mock repository should return
    func createViewModel(words: [String], configuration: RandomTextViewModel.Configuration? = nil) -> RandomTextViewModel {
        mockTextRepository.wordsReturnValue = words
        return RandomTextViewModel(textRepository: mockTextRepository, configuration: configuration)
    }

}

extension MotorwayRandomTextTests {
    
    func testViewModelGeneratingWords() {
        // given one choice of word, the output should simply be the one word repeated as many times as the
        // configuration specifies
        let viewModel = createViewModel(words: ["word"], configuration: RandomTextViewModel.Configuration(maxCount: 10))
        
        viewModel.updateRandomText()
        XCTAssertTrue(mockTextRepository.wordsCalled)
        XCTAssertEqual(viewModel.text, "word word word word word word word word word word")
        XCTAssertEqual(viewModel.wordCount, 10)
    }
    
    func testViewModelConfigureCounts() {
        for count in [10, 30, 50] {
            let viewModel = createViewModel(words: ["word"], configuration: RandomTextViewModel.Configuration(maxCount: count))
            viewModel.updateRandomText()
            XCTAssertEqual(viewModel.wordCount, count)
        }
    }
    
    func testViewModelEditingGeneratedWords() {
        let viewModel = createViewModel(words: ["word"], configuration: RandomTextViewModel.Configuration(maxCount: 10))
        
        viewModel.updateRandomText()
        viewModel.text = "" // select all and delete
        XCTAssertEqual(viewModel.wordCount, 0)
    }
    
    func testViewModelEmptyInputList() {
        let viewModel = createViewModel(words: [], configuration: RandomTextViewModel.Configuration(maxCount: 10))
        
        viewModel.updateRandomText()
        XCTAssertEqual(viewModel.text, "")
        XCTAssertEqual(viewModel.wordCount, 0)
    }
    
}
