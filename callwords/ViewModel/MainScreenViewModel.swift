//
//  MainScreenViewModel.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import Foundation


class MainScreenViewModel: ObservableObject {
    @Published var randomWords: [DataModel] = []
   
    @Published var chosenWord = ""
    @Published var chosenExplanation = ""
    
    func callWords() {
        NetworkManager.shared.callWords { [weak self] result in
            switch result {
            case .success(let data):
                self?.randomWords = data
                if !(self?.randomWords.isEmpty ?? false) {
                    guard let randomWord = self?.randomWords.randomElement() else { return }
                    
                    self?.chosenWord = randomWord.word ?? ""
                    self?.chosenExplanation = randomWord.explanation ?? ""
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}



