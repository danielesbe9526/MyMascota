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
    
    func addPet(name: String, type: PetType, age: String, image: Data?) {
        guard let age = Int(age) else { return }
        
        let pet = Pet(name: name,
                      type: type.rawValue,
                      age: age,
                      image: image)
        
        modelContext?.insert(pet)
        routeToMain()
    }
}

extension DashboardViewModel {
    func routeToMain() {
        destination?.navigateTo(screen: .main)
    }
}
