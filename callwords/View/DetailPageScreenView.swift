//
//  ContentView.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import SwiftUI
import Foundation

struct DetailPageScreenView: View {
 
    @ObservedObject var viewModel: DetailPageScreenViewModel
   
    
    init(viewModel: DetailPageScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Spacer(minLength: 20)
            Text("\(viewModel.chosenWord)")
                .font(
                    .custom("Helvetica", size: 60)
                        .weight(.bold))
                .foregroundStyle(LinearGradient(colors: [Color(UIColor.darkGray), .gray], startPoint: .top, endPoint: .bottom))
             Spacer(minLength: 50)
            VStack{
                Text("\(self.viewModel.randomWord)")
                    .padding(30)
                    .font(
                        .custom("Helvetica", size: 41)
                            .weight(.bold))
                    .foregroundStyle(.purple)
                Text("\(self.viewModel.randomExplanation)")
                    .padding(20)
                    .font(
                        .custom("Helvetica", size: 22)
                            .weight(.bold))
                    .foregroundStyle(Color(UIColor.darkGray))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment:.center)
            }.background(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(UIColor.lightGray), lineWidth: 2)
                    )
           Spacer()
            Button(action: {
                self.viewModel.callWords()
            }, label: {
                Text("Call Word")
                    .foregroundStyle(.white)
                    .font(.custom("Helvetica", size: 30)
                        .bold())
                    .padding(20)
                    .frame(width: 350)
                    .background(Color(UIColor(red: 0.23, green: 0.75, blue: 0.62, alpha: 1)))
                    .cornerRadius(10)
                    
            })
        }
        .padding()
        .onAppear{
            self.viewModel.callWords()
        }
    }
}

#Preview {
    DetailPageScreenView(viewModel: DetailPageScreenViewModel(chosenWord: "English", chosenExplanation: "English"))
}




