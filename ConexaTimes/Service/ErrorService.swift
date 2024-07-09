//
//  ErrorService.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

enum ErrorService: Error, LocalizedError {
    
    case invalidURL
    case serverError
    case invalidData
    case invalidResponse
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The Url provided is not valid"
            
        case .serverError:
            return "The server is not working"
            
        case .invalidData:
            return "The data provided does not work, try again later."
            
        case .invalidResponse:
            return "Invalid response from the server, please try again"
            
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
