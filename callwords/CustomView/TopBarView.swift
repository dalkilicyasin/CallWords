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
    
    init(buttonTitles: [String], buttonAction: ButtonAction = nil) {
        self.buttonTitles = buttonTitles
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: .zero ){
            ForEach(0..<buttonTitles.count, id: \.self){ index in
                Button(action: {
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
    TopBarView(buttonTitles: ["English","Spanish","Russian","Turkish"])
}
