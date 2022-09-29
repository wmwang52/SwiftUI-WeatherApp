//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by William Wang on 9/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityName()
                    
                MainWeatherView(imageName: "cloud.sun.fill")
                
                HStack(spacing:20){
                    WeatherDayView(weekday: "Mon",
                                   photo: "cloud.fill",
                                   temp: "72°")
                    
                    WeatherDayView(weekday: "Mon",
                                   photo: "cloud.fill",
                                   temp: "72°")
                    
                    WeatherDayView(weekday: "Mon",
                                   photo: "cloud.fill",
                                   temp: "72°")
                    
                    WeatherDayView(weekday: "Mon",
                                   photo: "cloud.fill",
                                   temp: "72°")
                    
                    WeatherDayView(weekday: "Mon",
                                   photo: "cloud.fill",
                                   temp: "72°")
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct WeatherDayView: View {
    
    var weekday: String
    var photo: String
    var temp: String
    
    var body: some View {
        
        VStack{
            Text(weekday)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName:photo)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,
                       height:40)
            Text(temp)
                .font(.system(size:28,weight:.medium))
                .foregroundColor(.white)
            
            
             
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint:.topLeading,
                       endPoint:.bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainWeatherView: View{
    var imageName:String
    
    var body: some View{
        VStack(spacing:10){
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180,
                       height:180)
            
            Text("76°")
                .font(.system(size:70,weight:.medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}

struct CityName: View {
    var body: some View {
        Text("Cupertino CA")
            .font(.system(size:32,
                          weight:.medium,
                          design:.default))
            .foregroundColor(.white)
            .padding()
        
    }
    
}
