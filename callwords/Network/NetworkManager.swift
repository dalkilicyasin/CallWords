//
//  NetworkManager.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import Foundation

 class NetworkManager {
    
     static  let shared = NetworkManager()
    
     func callWords(chosenWord: String, chosenExplanation: String, complation: @escaping (Result<[DataModel],ErrorHandling>) -> Void) {
        
         guard let fileLocation = Bundle.main.url(forResource: "\(chosenWord)-\(chosenExplanation)", withExtension: "json") else {return}
        
        do {
            let data = try? Data(contentsOf: fileLocation)
            let result = try JSONDecoder().decode([DataModel].self, from: data!)
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
