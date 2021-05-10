//
//  ContentView.swift
//  project 2
//
//  Created by Anisha Lamichhane on 3/29/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK"].shuffled()
    
    @State private var showingScore  = false
    @State private var scoreTitle = ""
    @State private var score = 0 //Challenge 1
    
    @State private var correct = false
   
   @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var rotationAmount = 0.0
    @State private var opacityAmount = 1.0
    
    var body: some View {
        
        ZStack {
//            Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors:[.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                
                VStack {
                    Text("Tap the flag of :")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                    
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    
                }
                 
                ForEach(0 ..< 3){
                    number in
                    Button(action: {
                        //flag was tapped
                        withAnimation {
                            self.flagTapped(number)
                            self.opacityAmount = 0.25
                        }
                        
                        
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color .black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.rotationAmount : 0), axis: (x: 0, y: 1, z: 0))
                    .opacity(number == self.correctAnswer ? 1 : self.opacityAmount)
                    
                
                   
                }
                
//                challenge 2
                VStack (spacing: 150){
                    Text("Total Score: \(score)")
                        .foregroundColor(.white)
                        .fontWeight(.black)
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
//    challenge 1
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 5
            
            rotationAmount = 0.0
                        
            withAnimation(.interpolatingSpring(stiffness: 20, damping: 5)) {
                self.rotationAmount = 360
            }
            
        } else {
            
            scoreTitle = "Wrong!! that is the flag of \(countries[number])"  // challenge 3
            score -= 3
           
        }
        showingScore = true
    }
    
   func askQuestion() {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        withAnimation(.easeInOut) {
               self.opacityAmount = 1.0
           }
           
           self.rotationAmount = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
