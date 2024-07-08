//
//  ConexaTimesApp.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import SwiftUI

@main
struct ConexaTimesApp: App {
    
    let service = Service()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                
                ConexaNewsHome(viewModel: HomeViewModel(service: service))
                    .tabItem{
                        Label("Noticias", systemImage: "newspaper")
                            .tint(.accentColor)
                    }
                
                UsersView(viewModel: UsersViewModel(service: service))
                    .tabItem{
                        Label("Usuarios", systemImage: "person.2")
                            .tint(.accentColor)
                    }
                
            }
            
        }
    }
}
