//
//  Item.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import Foundation
import SwiftData

@Model
final class Pet {
    var name: String
    var brand: String
    var age: Int
    
    init(name: String, brand: String, age: Int) {
        self.name = name
        self.brand = brand
        self.age = age
    }
}

