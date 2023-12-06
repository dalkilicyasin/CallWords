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
    let firstTitle: String?
    let buttonAction: ButtonAction
    
    init(image: Image? = nil,
         title: String? = nil,
         firstTitle: String? = nil,
         buttonAction: ButtonAction = nil) {
        self.image = image
        self.title = title
        self.firstTitle = firstTitle
        self.buttonAction = buttonAction
    }
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                if let title {
                    Text("\(title)")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                
                TopBarView(buttonTitles: ["English","Española","Россия","Türkçe"])
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                if let image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(height: 200)
                }
            }.padding(10)
                .background(.black.gradient)
                .cornerRadius(20)
                .onTapGesture {
                    if let buttonAction {
                        buttonAction()
                    }
                }
        }      
    }
}

#Preview {
    CardView(image: Image("eng"), title: "English")
}
