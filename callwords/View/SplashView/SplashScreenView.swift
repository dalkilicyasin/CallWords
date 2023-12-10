//
//  SplashScreenView.swift
//  callwords
//
//  Created by yasin on 10.12.2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            MainPageScreenView(viewModel: MainPageScreenViewModel())
        }else {
            VStack{
                VStack{
                    Image(uiImage: UIImage(named: "callwords") ?? UIImage())
                        .resizable()
                        .scaledToFit()
                }.scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
