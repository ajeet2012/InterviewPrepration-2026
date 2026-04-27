//
//  LoginViewModel.swift
//  ReactiveFramework
//
//  Created by Ajeet Sharma on 27/04/26.
//

import Foundation
import Combine

/*
 
 Subject :
 
 A Subject is a special publisher that allows manual emission of values using send() and can act as both publisher and subscriber.
 
 # PassthroughSubject vs CurrentValueSubject
 
 1. PassthroughSubject:
 
 
 let subject = PassthroughSubject<[Int], Never>()
 
 •    ❌ No initial value
 •    ❌ Doesn’t store last value
 •    ✅ Good for events (API response, button tap)
 
 
 
 2. CurrentValueSubject:
 
 •    ✅ Has initial value
 •    ✅ Stores latest value
 •    ✅ New subscribers get last value immediately
 
 
 
 */


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
