//
//  JSONLoader.swift
//  SwiftPokedex
//

import Foundation

enum JSONLoader {
    enum Error: Swift.Error, Equatable {
        case fileNotFound(String)
    }

    static func load<T: Decodable>(
        _ name: String,
        as type: T.Type,
        bundle: Bundle = .main
    ) throws -> T {
        guard let url = bundle.url(forResource: name, withExtension: "json") else {
            throw Error.fileNotFound(name)
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
