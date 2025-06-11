//
//  DogCache.swift
//  IloveDogs
//
//  Created by Arturo Ruiz on 10/06/25.
//

import Foundation

struct DogCache {
    private static let key = "cached_dogs"

    static func save(_ dogs: [Dog]) {
        do {
            let data = try JSONEncoder().encode(dogs)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Failed to write to cache: \(error)")
        }
    }

    static func load() -> [Dog]? {
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        do {
            return try JSONDecoder().decode([Dog].self, from: data)
        } catch {
            print("Failed to load from cache: \(error)")
            return nil
        }
    }
}
