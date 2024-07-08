//
//  UsersModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

struct UsersModel: Identifiable, Codable {
    let id: Int
    let firstname: String?
    let lastname: String?
    let email: String?
    let address: Address?
    
    
    struct Address: Codable {
        let street: String?
        let city: String?
        let geo: Geo?
        
        struct Geo: Codable {
            let lat: String?
            let lng: String?
            
        }
    }
}
