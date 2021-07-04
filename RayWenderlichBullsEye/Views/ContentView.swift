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
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButtonView(alertIsVisible: $alertIsVisible,
                                sliderValue: $sliderValue,
                                game: $game)
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderTextView(text: "1")
            Slider(value: $sliderValue, in: 0.0...100.0)
            SliderTextView(text: "100")
        }
        .padding()
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            self.alertIsVisible = true
        }) {
            Text("Hit Me".uppercased())
                .bold().font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color(.white))
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue: Int = Int(self.sliderValue.rounded())
            return Alert(title: Text("Hello There!"),
                         message: Text("The slider's value is  \(roundedValue).\n" +
                            "You scored \(self.game.points(sliderValue: roundedValue)) points this round"),
                         dismissButton: .default(Text("Nice")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        
        ContentView().previewLayout(.fixed(width: 528, height: 320))
        ContentView().previewLayout(.fixed(width: 528, height: 320)).preferredColorScheme(.dark)
    }
}
