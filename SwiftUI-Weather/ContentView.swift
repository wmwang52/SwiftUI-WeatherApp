//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by William Wang on 9/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var Day :[String] = ["Mon","Tues", "Wed", "Thurs", "Fri"]

    var Temperature :[Int] = [78,62,73,93,85]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityName(CityName: "Cupertino CA")
                    
                MainWeatherView(isNight: $isNight)
                
                
                
                HStack(spacing:20){
                    ForEach((0...4),
                            id: \.self) {
                        WeatherDayView(isNight: $isNight,
                                       weekday: Day[$0] ,
                                       temp: isNight ? Temperature[$0] - 20 : Temperature[$0])
                       }
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label:{
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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
    @Binding var isNight: Bool
    var weekday: String
    let randomInt = Int.random(in: 0...4)
    var Weather :[String] = ["sun.max.fill", "wind", "snowflake", "tornado", "cloud.sun.rain.fill"]
    var temp: Int
    var body: some View {
        VStack{
            Text(weekday)
                .font(.system(size: 16,
                              weight: .medium,
                              design: .default))
                .foregroundColor(.white)
            
            Image(systemName:isNight ? "moon.stars.fill" : Weather[randomInt])
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40,
                       height:40)
            Text("\(temp)°")
                .font(.system(size:28,
                              weight:.medium))
                .foregroundColor(.white)

        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint:.topLeading,
                       endPoint:.bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainWeatherView: View{

    @Binding var isNight:Bool
    var body: some View{
        VStack(spacing:10){
            Image(systemName:isNight ? "moon.stars.fill" : "cloud.sun.fill" )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:180,
                       height:180)
            Text("76°")
                .font(.system(size:70,
                              weight:.medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct CityName: View {
    var CityName:String
    var body: some View {
        Text(CityName)
            .font(.system(size:32,
                          weight:.medium,
                          design:.default))
            .foregroundColor(.white)
            .padding()
    }
}
