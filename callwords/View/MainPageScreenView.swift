//
//  MainPageScreenView.swift
//  callwords
//
//  Created by yasin on 29.11.2023.
//

import SwiftUI
import Foundation

struct MainPageScreenView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var  dragOffset: CGFloat = 0
    @ObservedObject var viewModel: MainPageScreenViewModel
  
    
    init(viewModel: MainPageScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            
            Text("\(viewModel.titele)")
            ZStack() {
                ForEach(0..<viewModel.languages.count, id: \.self){ index in
                    CardView(image: Image("\(viewModel.languages[index].image ?? "")"), title: "\(viewModel.languages[index].title ?? "")")
                        .frame(width: 300, height: 500)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                        .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                }
            }.gesture(
                DragGesture()
                    .onEnded({ value in
                        let treshold: CGFloat = 50
                        if value.translation.width > treshold {
                            withAnimation{
                                currentIndex = max(0, currentIndex - 1)
                            }
                        } else if value.translation.width < -treshold {
                            withAnimation {
                                currentIndex = min(viewModel.languages.count - 1, currentIndex + 1)
                            }
                        }
                    })
            )
        }
        .padding(20)
        .onAppear{
            viewModel.getLanguages()
        }
    }
}

#Preview {
    MainPageScreenView(viewModel: MainPageScreenViewModel())
}
