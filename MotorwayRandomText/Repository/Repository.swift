//
//  Repository.swift
//  MotorwayRandomText
//
//  Created by Liam on 18/02/23.
//

import Foundation

/// Base class for repositories that provides common functionality.
class Repository {
    
    private let decoder = JSONDecoder()
    
    func decode<T: Decodable>(from fileName: String) -> T {
        do {
            return try decoder.decode(T.self, from: data(from: fileName))
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    private func data(from fileName: String) throws -> Data {
        var data = Data()
        let bundle = Bundle(for: Self.self) // pointing to this class
        if let path = bundle.url(forResource: fileName, withExtension: "json") {
            data = try Data(contentsOf: path)
        }
        return data
    }
    
}
