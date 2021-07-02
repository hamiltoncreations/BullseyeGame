//
//  ContentView.swift
//  RayWenderlichBullsEye
//
//  Created by Matthew Hamilton on 6/29/21.
//  Copyright © 2021 Matthew Hamilton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .kerning(-1.0)
            }
            HStack {
                Text("1")
                    .bold()
                Slider(value: self.$sliderValue, in: 0.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                print("Hello, SwiftUI!")
                self.alertIsVisible = true
            }) {
                Text("Hit Me")
            }
            .alert(isPresented: $alertIsVisible, content: {
                let roundedValue: Int = Int(self.sliderValue.rounded())
                return Alert(title: Text("Hello There!"),
                             message: Text("The slider's value is  \(roundedValue).\n" +
                                "You scored \(self.game.points(sliderValue: roundedValue)) points this round"),
                             dismissButton: .default(Text("Nice")))
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        //ContentView().previewLayout(.fixed(width: 528, height: 320))
    }
}
