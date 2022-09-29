//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by William Wang on 9/29/22.
//

import SwiftUI

struct WeatherButton: View {
    var title:String
    var textColor: Color
    var backgroundColor:Color
    
    var body:some View{
        Text(title)
            .frame(width:250, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size:18,weight:.bold, design:.default))
            .cornerRadius(30.0)
    }
    
}
