//
//  SplashScreenView.swift
//  UlaServiceApp
//
//  Created by Mike Ulanov on 31.03.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
        } else {
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
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    self.isActive = true
                }
            }
        }
    }
}


#Preview {
    SplashScreenView()
}
