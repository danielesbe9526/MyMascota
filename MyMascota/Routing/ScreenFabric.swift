//
//  ScreenFabric.swift
//  HomeRecipients
//
//  Created by Daniel Beltran on 16/04/25.
//

import Foundation
import SwiftUI

public enum ScreenDestination: Equatable, Sendable, Hashable {
    case main
    case dashboard
}

struct ScreenFabric {
    @ObservedObject var dashboardViewModel: DashboardViewModel
    
    init(dashboardViewModel: DashboardViewModel) {
        self.dashboardViewModel = dashboardViewModel
    }
    
    @ViewBuilder
    func createViewFrom(screen: ScreenDestination) -> some View {
        switch screen {
        case .main:
            ContentView(viewModel: dashboardViewModel)
        case .dashboard:
            DashboardView(viewModel: dashboardViewModel)
            
        }
    }
}
