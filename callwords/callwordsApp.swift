//
//  callwordsApp.swift
//  callwords
//
//  Created by yasin on 28.11.2023.
//

import SwiftUI

@main
struct callwordsApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.red]
        
#if DEBUG
    print("Debug")
#else
    print("Release")
#endif
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
