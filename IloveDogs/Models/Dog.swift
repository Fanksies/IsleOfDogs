//
//  Dog.swift
//  IloveDogs
//
//  Created by Arturo Ruiz on 10/06/25.
//

import Foundation

struct Dog: Codable, Identifiable {
    let id = UUID()
    let dogName: String
    let description: String
    let age: Int
    let image: URL
    
    enum CodingKeys: String, CodingKey {
        case dogName
        case description
        case age
        case image
    }
}
