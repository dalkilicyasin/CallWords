//
//  TopBarView.swift
//  callwords
//
//  Created by yasin on 3.12.2023.
//

import SwiftUI

public typealias ButtonAction = (() -> ())?

struct TopBarView: View {
    let buttonTitles: [String]
    let buttonAction: ButtonAction
    @State private var selectedButtonIndex = 0
    @Binding var selectedTitle: String
    
    init(buttonTitles: [String], 
         buttonAction: ButtonAction = nil,
         selectedTitle: Binding<String>) {
        self.buttonTitles = buttonTitles
        self.buttonAction = buttonAction
        self._selectedTitle = selectedTitle
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
                })
            }
        }.cornerRadius(10)
    }
}

#Preview {
    TopBarView(buttonTitles: ["English","Spanish","Russian","Turkish"], selectedTitle: .constant("some"))
}
