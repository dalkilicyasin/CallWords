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
    @Binding var currentTitle: String
    @Binding var currentIndex: Int
    
    init(image: Image? = nil,
         title: String? = nil,
         firstTitle: String? = nil,
         currentTitle: Binding<String>,
         currentIndex: Binding<Int>,
         buttonAction: ButtonAction = nil) {
        self.image = image
        self.title = title
        self.firstTitle = firstTitle
        self._currentTitle = currentTitle
        self._currentIndex = currentIndex
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
                
                TopBarView(buttonTitles: ["English","Española","Россия","Türkçe"], buttonAction: {
                    //print("\(currentTitle)")
                }, selectedTitle: $currentTitle, selectedButtonIndex: $currentIndex).frame(minWidth: 0, maxWidth: .infinity)
                
                if let image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(height: 200)
                }
            }.padding(10)
                .background(LinearGradient(colors: [Color(UIColor.darkGray), .black], startPoint: .top, endPoint: .bottom))
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
    CardView(image: Image("eng"), title: "English", currentTitle: .constant(""), currentIndex: .constant(0))
}
