//
//  TopBarView.swift
//  callwords
//
//  Created by yasin on 3.12.2023.
//

import SwiftUI

typealias ButtonAction = () -> ()

struct TopBarView: View {
    let buttonTitles: [String]
    let buttonAction: ButtonAction?
    
    init(buttonTitles: [String], buttonAction: ButtonAction? = nil) {
        self.buttonTitles = buttonTitles
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        HStack{
            Button(action: {
                if let buttonAction {
                    buttonAction()
                }
            }, label: {
                ForEach(buttonTitles, id: \.self){ index in
                    Text("\(index)")
                        .padding(10)
                        .background(.black)
                        .font(.title)
                }
            })
        }.cornerRadius(20)
    }
}

#Preview {
    TopBarView(buttonTitles: ["first","second","third","third"])
}
