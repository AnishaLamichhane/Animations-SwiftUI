//
//  ContentView.swift
//  project 6
//
//  Created by Anisha Lamichhane on 5/1/21.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    var body: some View {
        
            
    Button("Tap Me") {
        self.enabled.toggle()
    }
    .frame(width: 200, height: 200)
    .background(enabled ? Color.red : Color.blue)
    .animation(nil)
    .foregroundColor(.white)
    .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
    .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    
   
   
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
