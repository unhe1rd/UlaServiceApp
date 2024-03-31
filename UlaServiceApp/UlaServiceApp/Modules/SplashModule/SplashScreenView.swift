//
//  Background.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//

import SwiftUI
import Combine
import UIKit

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    
    private let isActivePublisher = Just(true)
        .delay(for: 2, scheduler: DispatchQueue.main)
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    BackgroundView(imageOnBackground: true, durationTime: 2)
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2)){
                        self.opacity = 1.0
                    }
                }
            }
            .background(
                NavigationLink(destination: EmptyView(), isActive: $isActive) {
                    EmptyView()
                }
                .hidden()
                .onReceive(isActivePublisher) { value in
                    if value {
                        let mainVC = MainAssembly.assembly()
                        UIApplication.shared.windows.first?.rootViewController = mainVC
                    }
                }
            )
        }
    }
}






#Preview {
    SplashScreenView()
}
