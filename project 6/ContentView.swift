//
//  ContentView.swift
//  project 6
//
//  Created by Anisha Lamichhane on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    var body: some View {
        Button("Tap me ") {
//            animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Rectangle())
        
        .overlay(
        Rectangle()
            .stroke(Color.red)
            .scaleEffect(animationAmount)
            .opacity(Double(2 - animationAmount))
            .animation(
                Animation.easeInOut(duration: 2)
                    .repeatForever(autoreverses: false)
            )
        )
        .onAppear {
            self.animationAmount = 2
        }
//        .blur(radius: (animationAmount - 1) * 3)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
