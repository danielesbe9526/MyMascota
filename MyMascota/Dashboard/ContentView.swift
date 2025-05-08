//
//  ContentView.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var viewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "pawprint.fill") // Logo
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.orange)
                    
                    Text("My Mascota")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding()
                
                HStack {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                        .foregroundStyle(.gray.opacity(0.5))
                    
                    VStack(alignment: .leading) {
                        Text("Fido")
                            .font(.headline)
                        Text("Perro")
                            .font(.subheadline)
                        Text("Estado: Todo en orden")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    Spacer()
                }
                .padding()
                
//                "house.circle"
//                "calendar.circle"
//                "pills.circle"
//                "fork.knife.circle"
//                "tree.circle"
                HStack(spacing: 20) {
                    VStack {
                        Button(action: {
                            // Acción para citas
                        }) {
                            VStack {
                                Image(systemName: "calendar.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                Text("Citas")
                                    .font(.caption)
                            }
                        }
                    }
                    
                    VStack {
                        Button(action: {
                            // Acción para medicaciones
                        }) {
                            VStack {
                                Image(systemName: "pills")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                Text("Medicaciones")
                                    .font(.caption)
                            }
                        }
                    }
                    // Alimentación
                    VStack {
                        Button(action: {
                            // Acción para alimentación
                        }) {
                            VStack {
                                Image(systemName: "fork.knife")
                                    .font(.largeTitle)
                                    .foregroundColor(.green)
                                Text("Alimentación")
                                    .font(.caption)
                            }
                        }
                    }
                    // Actividades
                    VStack {
                        Button(action: {
                            // Acción para actividades
                        }) {
                            VStack {
                                Image(systemName: "pawprint")
                                    .font(.largeTitle)
                                    .foregroundColor(.orange)
                                Text("Actividades")
                                    .font(.caption)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView(viewModel: DashboardViewModel())
        .modelContainer(for: Pet.self, inMemory: true)
}
