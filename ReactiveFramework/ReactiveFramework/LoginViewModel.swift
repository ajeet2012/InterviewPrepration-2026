//
//  LoginViewModel.swift
//  ReactiveFramework
//
//  Created by Ajeet Sharma on 27/04/26.
//

import Foundation
import Combine


enum NetworkError: Error {
    case noDataAvailable
    case unableToProcessData
}

class LoginViewModel {
     
    //These are Publishers
    @Published var isLoading: Bool = false
    @Published var error: NetworkError? = nil
    @Published var responseArray: [Int] = []
    
    
    func apiCall() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
            // self.error = .noDataAvailable
            self.responseArray = [12, 23, 34, 44, 55]
        }
    }
}
