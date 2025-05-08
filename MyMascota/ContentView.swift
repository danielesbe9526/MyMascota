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
    @Query private var items: [Pet]

    var body: some View {
            NavigationView {
                VStack {
                    // Encabezado con logo y título
                    HStack {
                        Image(systemName: "pawprint.fill") // Logo
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.orange)
                        Text("PetHealth Tracker")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding()

                    // Resumen rápido
                    HStack(alignment: .top) {
                        // Foto de la mascota
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding()

                        // Información de la mascota
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

                    // Botones principales
                    HStack(spacing: 20) {
                        // Citas
                        VStack {
                            Button(action: {
                                // Acción para citas
                            }) {
                                VStack {
                                    Image(systemName: "calendar")
                                        .font(.largeTitle)
                                        .foregroundColor(.blue)
                                    Text("Citas")
                                        .font(.caption)
                                }
                            }
                        }
                        // Medicaciones
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

                    // Sección inferior para notificaciones
                    VStack(alignment: .leading) {
                        Text("Recordatorios y Notificaciones")
                            .font(.headline)
                            .padding(.bottom, 5)

                        // Aquí puedes agregar una lista de notificaciones
                        Text("No hay notificaciones pendientes.")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding()
                }
                .navigationBarHidden(true)
            }
        }

    private func addItem() {
        withAnimation {
//            let newItem =
//            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}
