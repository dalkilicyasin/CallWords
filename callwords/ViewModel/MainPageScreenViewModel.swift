//
//  MainPageScreenViewModel.swift
//  callwords
//
//  Created by yasin on 29.11.2023.
//

import Foundation
import SwiftUI

class MainPageScreenViewModel: ObservableObject {
    @Published  var languages: [LanguageModel] = []
    @Published  var explanation = "English"
    @Published  var word = "English"
    
    func getLanguages(){
        self.languages = []
        let english = LanguageModel(image: "eng", title: Language.english.rawValue)
        let spanish = LanguageModel(image: "esp", title: Language.spanish.rawValue)
        let russian = LanguageModel(image: "rus", title: Language.russian.rawValue)
        let turkish = LanguageModel(image: "tr", title: Language.turkish.rawValue)
        
        self.languages.append(english)
        self.languages.append(spanish)
        self.languages.append(russian)
        self.languages.append(turkish)
    }
}

public enum Language: String {
    case english = "English"
    case spanish = "Española"
    case russian = "Россия"
    case turkish = "Türkçe"
}
