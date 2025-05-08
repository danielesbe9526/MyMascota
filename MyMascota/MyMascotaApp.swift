//
//  MyMascotaApp.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import SwiftUI
import SwiftData

@main
struct MyMascotaApp: App {
    let destinationViewModel: DestinationViewModel
    let dashboardViewModel: DashboardViewModel
    let fabric: ScreenFabric
    
    init() {
        destinationViewModel = DestinationViewModel()
        dashboardViewModel = DashboardViewModel(destination: destinationViewModel)
        fabric = ScreenFabric(dashboardViewModel: dashboardViewModel)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationWrapperView(viewModel: destinationViewModel, fabric: fabric) {
                fabric.createViewFrom(screen: .main)
            }
        }
        .modelContainer(for: Pet.self)
    }
}
