//
//  TopBarView.swift
//  callwords
//
//  Created by yasin on 3.12.2023.
//

import SwiftUI

public typealias ButtonAction = (() -> ())?

public enum Language: String {
    case english = "English"
    case spanish = "Española"
    case russian = "Россия"
    case turkish = "Türkçe"
}

struct TopBarView: View {
    let buttonTitles: [String]
    let buttonAction: ButtonAction
    @Binding var selectedButtonIndex: Int
    @Binding var selectedTitle: String
    
    init(buttonTitles: [String], 
         buttonAction: ButtonAction = nil,
         selectedTitle: Binding<String>,
         selectedButtonIndex: Binding<Int>) {
        self.buttonTitles = buttonTitles
        self.buttonAction = buttonAction
        self._selectedTitle = selectedTitle
        self._selectedButtonIndex = selectedButtonIndex
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: .zero ){
            ForEach(0..<buttonTitles.count, id: \.self){ index in
                Button(action: {
                    self.selectedTitle = buttonTitles[index]
                    if let buttonAction {
                        buttonAction()
                    }
                    selectedButtonIndex = index
                }, label: {
                    Text("\(buttonTitles[index])")
                        .padding(10)
                        .background(selectedButtonIndex == index ? .green : .black)
                        .font(.init(.caption)?.bold())
                        .foregroundColor(.white)
                })
            }
        }.cornerRadius(10)
    }
}

#Preview {
    TopBarView(buttonTitles: [Language.english.rawValue,Language.spanish.rawValue,Language.russian.rawValue,Language.turkish.rawValue], selectedTitle: .constant("some"), selectedButtonIndex: .constant(0))
}
