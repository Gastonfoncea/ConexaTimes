//
//  UsersViewModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation
import UIKit


enum UserviewState {
    case loading
    case loaded
    case error(ErrorService)
}


class UsersViewModel: ObservableObject {
    
    let service: ProtocolService
    @Published var viewState: UserviewState = .loading
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
                    self.viewState = .loaded
                case .failure(let error):
                    self.error = error
                    self.viewState = .error(error)
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
