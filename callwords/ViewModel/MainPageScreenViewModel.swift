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
        let english = LanguageModel(image: "eng", title: "İngilizce")
        let spanish = LanguageModel(image: "esp", title: "İspanyolca")
        let russian = LanguageModel(image: "rus", title: "Rusça")
        
        self.languages.append(english)
        self.languages.append(spanish)
        self.languages.append(russian)
    }
}
