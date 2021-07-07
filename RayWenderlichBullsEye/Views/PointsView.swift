//
//  PointsView.swift
//  RayWenderlichBullsEye
//
//  Created by Matthew Hamilton on 7/6/21.
//  Copyright © 2021 Matthew Hamilton. All rights reserved.
//

import SwiftUI

struct PointsView: View {
    @State var sliderValue: Int
    @State var points: Int
    
    var body: some View {
        VStack (spacing:10.0) {
            InstructionText(text: "The sliders value is")
            BigNumberText(text: String(sliderValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action:{}) {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth:300)
        .background(
            Color("BackgroundColor")
        )
        .cornerRadius(21.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        let sliderValue = 99
        let points = 54
        
        PointsView(sliderValue: sliderValue, points: points)
        PointsView(sliderValue: sliderValue, points: points)
            .preferredColorScheme(.dark)
        
        PointsView(sliderValue: sliderValue, points: points).previewLayout(.fixed(width: 528, height: 320))
        PointsView(sliderValue: sliderValue, points: points).previewLayout(.fixed(width: 528, height: 320)).preferredColorScheme(.dark)
    }
}
