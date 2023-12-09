//
//  MainPageScreenView.swift
//  callwords
//
//  Created by yasin on 29.11.2023.
//

import SwiftUI
import Foundation

struct MainPageScreenView: View {
    @State private var goToOtherView: Bool = false
    @State private var currentIndex: Int = 0
    @GestureState private var  dragOffset: CGFloat = 0
    @ObservedObject var viewModel: MainPageScreenViewModel

    init(viewModel: MainPageScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack() {
                    ForEach(0..<viewModel.languages.count, id: \.self){ index in
                        CardView(image: Image("\(viewModel.languages[index].image ?? "")"), title: "\(viewModel.languages[index].title ?? "")", currentTitle: $viewModel.explanation, buttonAction: {
                            viewModel.word = viewModel.languages[index].title ?? ""
                            self.goToOtherView.toggle()
                        })
                        .frame(width: 300, height: 300)
                        .opacity(currentIndex == index ? 1.0 : 0.5)
                        .scaleEffect(currentIndex == index ? 1.2 : 0.8)
                        .offset(x: CGFloat(index - currentIndex) * 300 + dragOffset, y: 0)
                    }
                    
                    NavigationLink(
                        destination: DetailPageScreenView(viewModel: DetailPageScreenViewModel(chosenWord: viewModel.word , chosenExplanation: viewModel.explanation)),
                        isActive: self.$goToOtherView,
                        label: {
                            EmptyView()
                        })
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
            .onAppear{
                viewModel.getLanguages()
            }
        }
    }
}

#Preview {
    MainPageScreenView(viewModel: MainPageScreenViewModel())
}
