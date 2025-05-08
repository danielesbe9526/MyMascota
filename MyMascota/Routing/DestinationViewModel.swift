//
//  DestinationViewModel.swift
//  HomeRecipients
//
//  Created by Daniel Beltran on 16/04/25.
//

import Foundation

@MainActor
final public class DestinationViewModel: ObservableObject {
    @Published public var destination: [ScreenDestination]
    
    public init(destination: [ScreenDestination] = []) {
        self.destination = destination
    }
    
    func navigateTo(screen: ScreenDestination) {
        destination.removeAll(where: { $0 == screen })
        destination.append(screen)
    }
    
    func popTo(screen: ScreenDestination) {
        guard let screenIndex = destination.firstIndex(where: { $0 == screen }) else { return }
        destination = Array(destination.prefix(through: screenIndex))
    }
}
