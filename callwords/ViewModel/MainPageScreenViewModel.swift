//
//  MainPageScreenViewModel.swift
//  callwords
//
//  Created by yasin on 29.11.2023.
//

import Foundation
import SwiftUI

class MainPageScreenViewModel: ObservableObject {
    
    @Published private(set) var languages: [LanguageModel] = []
    @Published private(set) var titele = "Language"
    
    
    func getLanguages(){
        let english = LanguageModel(image: "eng", title: "English")
        let spanish = LanguageModel(image: "esp", title: "Española")
        let russian = LanguageModel(image: "rus", title: "Россия")
        let turkish = LanguageModel(image: "tr", title: "Türkçe")
        
        self.languages.append(english)
        self.languages.append(spanish)
        self.languages.append(russian)
        self.languages.append(turkish)
    }
}
