//
//  DogVideoModel.swift
//  IloveDogs
//
//  Created by Arturo Ruiz on 10/06/25.
//

import SwiftUI

@MainActor
class DogViewModel: ObservableObject {
    @Published var dogs: [Dog] = []
    @Published var isLoading: Bool = false
    @Published var error: String?
    
    private let service = DogFetcher()

    func load() async {
        isLoading = true
        error = nil
        
        if let cached = DogCache.load() {
            dogs = cached
        }
        
        do {
            let result = try await service.fetchDogs()
            self.dogs = result
            DogCache.save(result)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
}
