//
//  UsersViewModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation
import UIKit

class UsersViewModel: ObservableObject {
    
    let service: ProtocolService
    @Published var users: [UsersModel] = []
    @Published var error: ErrorService?
    
    
    init(service: ProtocolService) {
        self.service = service
    }
    
    
    func fetchAllUsers() {
        service.fetchUsers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.users = data
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    
    func openGoogleMaps(lat: String, lng: String) {
           let url = URL(string: "comgooglemaps://?q=\(lat),\(lng)")!
           if UIApplication.shared.canOpenURL(url) {
               UIApplication.shared.open(url)
           } else {
               let url = URL(string: "https://maps.google.com/?q=\(lat),\(lng)")!
               UIApplication.shared.open(url)
           }
       }
}
