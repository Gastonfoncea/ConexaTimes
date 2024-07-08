//
//  UsersView.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                
                listOfUsers
            }
            .padding(.top,60)
           
        }
        .navigationTitle("Usuarios")
        .onAppear {
            viewModel.fetchAllUsers()
        }
    }
}

#Preview {
    UsersView(viewModel: UsersViewModel(service: Service()))
}


extension UsersView {
    
    private var listOfUsers: some View {
        VStack{
            if  viewModel.error != nil {
                Text("error en algun lado")
                
            } else if viewModel.users.isEmpty {
                Text("No hay usuarios")
                
            } else {
                VStack {
                    HStack{
                        Text("Usuarios")
                            .font(.title2)
                            .padding(.horizontal,20)
                            .bold()
                        Spacer()
                    }
                    List(viewModel.users) {user in
                            Button(action: {
                                if let lat = user.address?.geo?.lat, let lng = user.address?.geo?.lng {
                                    viewModel.openGoogleMaps(lat: lat, lng: lng)
                                } else {
                                    alertMessage = "Ubicación no disponible para el usuario \(user.firstname ?? "") \(user.lastname ?? "")"
                                    showingAlert = true
                                }
                            }) {
                                UserCard(firstName: user.firstname ?? "", lastName: user.lastname ?? "", city: user.address?.city ?? "", street: user.address?.street ?? "")
                            }
                        
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                
            }
        }
    }
}
