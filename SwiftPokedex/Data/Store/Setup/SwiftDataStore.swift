//
//  SwiftDataStore.swift
//  SwiftPokedex
//

import Foundation
import SwiftData

enum SwiftDataStore {
    static let schema = Schema([PokemonEntity.self, TypeEntity.self])
    private static let storeFileName = "SwiftPokedex.store"

    static func makeContainer(inMemory: Bool = false) throws -> ModelContainer {
        let configuration = try makeConfiguration(inMemory: inMemory)
        let container = try ModelContainer(for: schema, configurations: [configuration])

        var seeder = StoreSeeder(context: container.mainContext)
        try seeder.seedIfNeeded()

        return container
    }

    private static func makeConfiguration(inMemory: Bool) throws -> ModelConfiguration {
        if inMemory {
            return ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        }

        let storeURL = applicationSupportDirectory().appending(path: storeFileName)
        return ModelConfiguration(schema: schema, url: storeURL)
    }

    private static func applicationSupportDirectory() -> URL {
        let directory = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        try? FileManager.default.createDirectory(
            at: directory,
            withIntermediateDirectories: true
        )

        return directory
    }
}
