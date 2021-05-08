//
//  ContentView.swift
//  project 6
//
//  Created by Anisha Lamichhane on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    var body: some View {
        
            
    Button("Tap Me") {
        withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
            self.animationAmount += 360
        }
    }
    .padding(40)
    .background(Color.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .rotation3DEffect(
        .degrees(animationAmount),
        axis: (x: 1, y: 0, z: 1)
    )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
