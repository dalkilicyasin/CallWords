//
//  NetworkManager.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import Foundation

 class NetworkManager {
    
     static  let shared = NetworkManager()
    
     func callWords(complation: @escaping (Result<[DataModel],ErrorHandling>) -> Void) {
        
         guard let fileLocation = Bundle.main.url(forResource: "generated", withExtension: "json") else {return}
        
        
        do {
            let data = try? Data(contentsOf: fileLocation)
            let result = try JSONDecoder().decode([DataModel].self, from: data!)
            print(result)
            complation(.success(result))
        } catch {
            print("parsing error")
            complation(.failure(ErrorHandling.decodeFault))
        }
    }
}

enum ErrorHandling: Error {
    case serviceFault
    case decodeFault
}
