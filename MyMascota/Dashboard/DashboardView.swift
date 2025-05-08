//
//  DashboardView.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var dashboardViewModel: DashboardViewModel
    @State var tab: TabState
    var body: some View {
        TabView {
            ContentView(viewModel: dashboardViewModel)
                .tabItem {
                    Label("Main", systemImage: "house.circle")
                }
                .tag(TabState.main)
            
     
            MedicalAppointmentView()
                .tabItem {
                    Label("Citas", systemImage: "calendar.circle")
                }
            
            MedicationsView()
                .tabItem {
                    Label("Medicaciones", systemImage: "pills.circle")

                }
            
            FoodView()
                .tabItem {
                    Label("Alimentacion", systemImage: "fork.knife.circle")
                }
            
            ActivityView()
                .tabItem {
                    Label("Actividades", systemImage: "tree.circle")
                }
        }
    }
}

#Preview {
    DashboardView(dashboardViewModel: DashboardViewModel(), tab: .main)
}


public enum TabState : Sendable {
    case medicalAppointment
    case medication
    case food
    case activities
    case main
}

