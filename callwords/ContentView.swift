//
//  ContentView.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
 
    @ObservedObject var viewModel: MainScreenViewModel
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Word: \(self.viewModel.chosenWord)")
                .padding(20)
                .background(.cyan)
            Text("Explanation: \(self.viewModel.chosenExplanation)")
                .padding(20)
                .background(.yellow)
           
            Button(action: {
                self.viewModel.callWords()
            }, label: {
                Text("Call Word")
                    .padding(30)
                    .background(.red)
                    .cornerRadius(20)
            })
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: MainScreenViewModel())
}




