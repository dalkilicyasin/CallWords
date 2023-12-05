//
//  CardView.swift
//  callwords
//
//  Created by yasin on 29.11.2023.
//

import SwiftUI

struct CardView: View {
    let image: Image?
    let title: String?
    let buttonAction: ButtonAction
    
    init(image: Image? = nil,
         title: String? = nil,
         buttonAction: ButtonAction = nil) {
        self.image = image
        self.title = title
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        VStack{
            if let title {
                Text("\(title)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            
            if let image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(height: 300)
                    
            }
        }.padding(20)
            .background(.black.gradient)
            .cornerRadius(20)
            .onTapGesture {
                if let buttonAction {
                    buttonAction()
                }
            }
            
    }
}

#Preview {
    CardView(image: Image("eng"), title: "English")
}
