//
//  DashboardView.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var dashboardViewModel: DashboardViewModel
    
    @State private var selectedType: PetType = .dog
    @State private var name: String = ""
    @State private var age: String = ""
    
    var body: some View {
        VStack {
            Image(ImageResource.perroYGato)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .padding(.top, 40)
                .padding(.bottom, -45)
            
            VStack {
                Text("Bienvenido")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Debes registrar primero a tu mascota")
                    .font(.caption)
                    .fontWeight(.medium)
                    .padding(.bottom)
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 8)

            Form {
                Picker("Tipo de mascota", selection: $selectedType) {
                    Text("Perro")
                        .tag(PetType.dog)
                    Text("Gato")
                        .tag(PetType.cat)
                    Text("Pez")
                        .tag(PetType.fish)
                    Text("Otro")
                        .tag(PetType.other)
                }.pickerStyle(.palette)
                
                TextField("Nombre", text: $name)
                
                TextField("Edad", text: $age)
                    .keyboardType(.numberPad)
                
                Button("Sube una foto de tu mascota", systemImage: "photo") {
                    
                }
                .buttonStyle(.plain)
                .background(.cyan)
                .foregroundStyle(.white)
                
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 8)
            
            HStack {
                Spacer()
                Button("Continar") {
                    
                }
                .background(.white)
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal, 8)
            
            Spacer()
        }
        .background(.cyan)
    }
}

#Preview {
    DashboardView(dashboardViewModel: DashboardViewModel())
}


public enum TabState : Sendable {
    case medicalAppointment
    case medication
    case food
    case activities
    case main
}

