//
//  DashboardView.swift
//  MyMascota
//
//  Created by Daniel Beltran on 8/05/25.
//

import SwiftUI
import PhotosUI

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    @State private var selectedType: PetType = .dog
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var inputImage: UIImage?
    @State private var imagePickerItem: PhotosPickerItem?
    @State private var imageData: Data? = nil
    
    var body: some View {
        VStack {
            Image(ImageResource.perroYGato)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .padding(.top, 100)
                .padding(.bottom, -45)
            
            VStack {
                Text("Bienvenido")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Primero debes registrar  a tu mascota")
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
                
                PhotosPicker(selection: $imagePickerItem) {
                    HStack(spacing: 20) {
                        
                        Image(uiImage: (inputImage ?? UIImage(systemName: "photo"))!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                        
                        Text("Sube una foto de tu mascota")
                    }
                    .padding()
                    .background(.cyan)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .buttonStyle(.bordered)
                    .foregroundStyle(.white)
                }
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(height: 300)
            .padding()
            
            Spacer()
            
            HStack {
                Spacer()
                Button("Continuar") {
                    viewModel.addPet(name: name,
                                     type: selectedType,
                                     age: age,
                                     image: imageData)
                }
                .background(.cyan)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .buttonStyle(.bordered)
                .foregroundStyle(.white)
                    
            }
            .padding()
            
            Spacer()
        }
        .background {
            LinearGradient(
                colors: [.cyan, .white],
                startPoint: .top,
                endPoint: .bottom)
        }
        .ignoresSafeArea()
        .onChange(of: imagePickerItem) { _ , newValue in
            Task {
                if let imagePickerItem,
                   let data = try? await imagePickerItem.loadTransferable(type: Data.self) {
                    imageData = data
                    
                    if let image = UIImage(data: data) {
                        inputImage = image
                    }
                }
                
                imagePickerItem = nil
            }
        }
    }
}

#Preview {
    DashboardView(viewModel: DashboardViewModel())
}


public enum TabState : Sendable {
    case medicalAppointment
    case medication
    case food
    case activities
    case main
}

