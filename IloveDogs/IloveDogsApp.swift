//
//  IloveDogsApp.swift
//  IloveDogs
//
//  Created by Arturo Ruiz on 10/06/25.
//

import SwiftUI

@main
struct IloveDogsApp: App {
    init() {
        // Clear cache on launch
        // TODO: Validate
        // UserDefaults.standard.removeObject(forKey: "cached_dogs")
    }
    var body: some Scene {
        WindowGroup {
            DogView()
        }
    }
}
