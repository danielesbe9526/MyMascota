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
    
    @Query(sort: \Pet.name, order: .forward)
    var pets: [Pet]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "pawprint.circle") // Logo
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                        
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
                            Image(systemName: "cat")
                                .resizable()
                                .frame(width: 25, height: 25)
                            
                            Text("Lilo")
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Text("3 años")
                                .font(.subheadline)
                            
                        }
                        Spacer()
                    }
                    .padding()
                }
                .frame(height: 400)
                .background {
                    LinearGradient(
                        colors: [.cyan,.cyan.opacity(0.7), .clear],
                        startPoint: .top,
                        endPoint: .bottom)
                }
                .ignoresSafeArea()
                
                HStack {
                    VStack(alignment: .leading) {
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "calendar.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                Text("Citas")
                                    .font(.caption)
                            }
                        }
                        
                        
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "pills.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                Text("Medicaciones")
                                    .font(.caption)
                            }
                        }
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "fork.knife.circle")
                                    .font(.largeTitle)
                                    .foregroundColor(.green)
                                Text("Alimentación")
                                    .font(.caption)
                            }
                        }
                        
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image(systemName: "tree.circle")
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
