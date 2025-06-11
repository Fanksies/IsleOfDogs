//
//  DogFetcher.swift
//  IloveDogs
//
//  Created by Arturo Ruiz on 10/06/25.
//

import Foundation

class DogFetcher {
    private var dogURL = URL(string: "https://jsonblob.com/api/1151549092634943488")
    func fetchDogs() async throws -> [Dog] {
        let (data, _) = try await URLSession.shared.data(from: dogURL!)
        let dogs = try JSONDecoder().decode([Dog].self, from: data)
        return dogs
    }
}
