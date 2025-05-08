//
//  DashboardViewModel.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import Foundation
import SwiftData

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published public var destination: DestinationViewModel?
    var modelContext: ModelContext?
    
    init(destination: DestinationViewModel? = nil, modelContext: ModelContext? = nil) {
        self.destination = destination
        self.modelContext = modelContext
    }
    
    func getColorImage() -> Image {
        
    }
    
    func addPet(name: String, type: PetType, age: Int) {
        let pet = Pet(name: "",
                      type: type.rawValue,
                      age: age)
    }
    
}

extension DashboardViewModel {

}
