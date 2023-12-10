//
//  MainScreenViewModel.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import Foundation


class DetailPageScreenViewModel: ObservableObject {
    @Published var randomWords: [DataModel] = []
    @Published var chosenWord: String
    @Published var chosenExplanation: String
    @Published private(set) var randomWord: String = ""
    @Published private(set) var randomExplanation: String = ""
    
    init( chosenWord: String, chosenExplanation: String ) {
        self.chosenWord = chosenWord
        self.chosenExplanation = chosenExplanation
    }
    
    func callWords() {
        var chosenWord = chosenWord.lowercased()
        var chosenExplanation = chosenExplanation.lowercased()
        chosenWord = convertWords(word: chosenWord)
        chosenExplanation = convertWords(word: chosenExplanation)
        
        NetworkManager.shared.callWords(chosenWord: chosenWord, chosenExplanation: chosenExplanation) { [weak self] result in
            switch result {
            case .success(let data):
                self?.randomWords = data
                if !(self?.randomWords.isEmpty ?? false) {
                    guard let randomWord = self?.randomWords.randomElement() else { return }
                    
                    self?.randomWord = randomWord.word ?? ""
                    self?.randomExplanation = randomWord.explanation ?? ""
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
    
    func convertWords(word: String) -> String {
        switch word {
        case "española": return "spanish"
        case "россия": return "russian"
        case "türkçe": return "turkish"
        case "english": return "english"
        default:
          return  "empty"
        }
    }
}



