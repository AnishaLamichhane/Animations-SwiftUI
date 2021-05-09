//
//  ContentView.swift
//  project 6
//
//  Created by Anisha Lamichhane on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero //we need some state to store the amount of their drag:
    

    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
           
            
            .gesture(
            DragGesture()
                .onChanged{ self.dragAmount = $0.translation} // lets us run a closure whenever the user moves their finger.
                .onEnded{ _ in
                    withAnimation(.spring()) { // this is explicit animation 
                        self.dragAmount = .zero } //lets us run a closure when the user lifts their finger off the screen, ending the drag.
                    }
                    
            )
           // its an implicit animation
//            .animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
