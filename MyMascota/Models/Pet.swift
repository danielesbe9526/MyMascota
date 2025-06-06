//
//  Item.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import Foundation
import SwiftData

@Model
final class Pet: Sendable {
    var name: String
    var type: String
    var age: Int
    var image: Data?
    
    init(name: String, type: String, age: Int, image: Data? = nil) {
        self.name = name
        self.type = type
        self.age = age
        self.image = image
    }
    
    static func example() -> Pet {
        let pet = Pet(name: "Lilo", type: "Perro", age: 3)
        return pet
    }
}


enum PetType: String {
    case dog = "Perro"
    case cat = "Gato"
    case fish = "Pez"
    case other = "Otro"
}
