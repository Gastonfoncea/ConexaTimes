//
//  ProtocolService.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 08/07/2024.
//

import Foundation


protocol ProtocolService {
    
    func fetchNews(completion: @escaping (Result<[NewsModel], ErrorService>) -> Void)
    
    func fetchUsers(completion: @escaping(Result<[UsersModel],ErrorService>) ->Void)
}
