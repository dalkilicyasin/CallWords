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
        VStack(spacing: 20) {
            Text("\(viewModel.chosenWord)")
                .font(
                    .custom("Helvetica", size: 60)
                        .weight(.bold))
                .foregroundStyle(Gradient(colors: [.red, .black]))
             Spacer()
            VStack{
                Text("\(self.viewModel.randomWord)")
                    .padding(30)
                    .font(
                        .custom("Helvetica", size: 41)
                            .weight(.bold))
                    .foregroundStyle(.white)
                Text("\(self.viewModel.randomExplanation)")
                    .padding(20)
                    .font(
                        .custom("Helvetica", size: 22)
                            .weight(.bold))
                    .foregroundStyle(.blue)
            }.background(Gradient(colors: [.black]))
                .cornerRadius(20)
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
                    .background(Gradient(colors: [.black, .red]))
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




