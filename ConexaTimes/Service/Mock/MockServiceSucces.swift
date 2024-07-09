//
//  MockServiceFailure.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 08/07/2024.
//

import Foundation


class MockServiceSucces: ProtocolService {
    func fetchNews(completion: @escaping (Result<[NewsModel], ErrorService>) -> Void) {
        
    }
    
    func fetchUsers(completion: @escaping (Result<[UsersModel], ErrorService>) -> Void) {
        let users = [
            UsersModel(id: 1, firstname: "User", lastname: "User2", email: "User", address: UsersModel.Address(street: "User", city: "User", geo: UsersModel.Address.Geo(lat: "1", lng: "1") )),
            UsersModel(id: 1, firstname: "User", lastname: "User2", email: "User", address: UsersModel.Address(street: "User", city: "User", geo: UsersModel.Address.Geo(lat: "1", lng: "1") ))
        ]
        completion(.success(users))
    }
    
    
}
