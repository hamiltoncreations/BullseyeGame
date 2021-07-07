//
//  TextViews.swift
//  RayWenderlichBullsEye
//
//  Created by Matthew Hamilton on 7/4/21.
//  Copyright © 2021 Matthew Hamilton. All rights reserved.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(String(text))
            .fontWeight(.black)
            .font(.largeTitle)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth:.infinity)
            .background(
                Color.accentColor
            )
            .cornerRadius(12.0)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderTextView(text: "99")
            LabelTextView(text: "Score")
            BodyText(text: "You scored 200 points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }
        .padding()
    }
}
