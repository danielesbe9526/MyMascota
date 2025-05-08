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
    
    init(name: String, type: String, age: Int) {
        self.name = name
        self.type = type
        self.age = age
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
