//
//  NavigationWrapper.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import SwiftUI

// Toca crear una vista wrapper para poder pasar el binding de el destinationViewModel como parametro de path a el navigation stack, de otra forma no se puede inicializar como state object sin haber antes inicializado las otras propiedades
struct NavigationWrapperView<Content: View>: View {
    @ObservedObject var viewModel: DestinationViewModel
    var fabric: ScreenFabric
    
    var content: () -> Content
    
    init (
        viewModel: DestinationViewModel,
        fabric: ScreenFabric,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.viewModel = viewModel
        self.fabric = fabric
        self.content = content
    }
    
    var body: some View {
        
        NavigationStack(path: $viewModel.destination) {
            content()
                .navigationDestination(for: ScreenDestination.self) {
                    fabric.createViewFrom(screen: $0)
                }
        }
    }
}
