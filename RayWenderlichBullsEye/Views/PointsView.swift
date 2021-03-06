//
//  PointsView.swift
//  RayWenderlichBullsEye
//
//  Created by Matthew Hamilton on 7/6/21.
//  Copyright Ā© 2021 Matthew Hamilton. All rights reserved.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack (spacing:10.0) {
            InstructionText(text: "The sliders value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\nššš")
            Button(action:{
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
                
            }) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth:300)
        .background(
            Color("BackgroundColor")
        )
        .cornerRadius(Constants.General.roundRectViewCornerRadius)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
        .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game).previewLayout(.fixed(width: 528, height: 320))
        PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game).previewLayout(.fixed(width: 528, height: 320)).preferredColorScheme(.dark)
    }
}
