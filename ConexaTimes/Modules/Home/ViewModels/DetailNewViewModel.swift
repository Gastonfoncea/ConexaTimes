//
//  DetailNewViewModel.swift
//  ConexaTimes
//
//  Created by Gaston Foncea on 06/07/2024.
//

import Foundation

class DetailNewViewModel: ObservableObject {

    let service: Service
    
    init(service: Service) {
        self.service = service
    }
    
}
