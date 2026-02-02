//
//  ContentView.swift
//  Omoi
//
//  Created by Sudharsan Baskaran on 04/11/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(red: 247 / 255, green: 233 / 255, blue: 212 / 255)
                .ignoresSafeArea()
            
            VStack(spacing:20) {
                
                HStack {
                    Text("Today, Jul 15")
                        .font(.system(size: 24 , weight: .semibold))
                        .foregroundColor(Color(red: 198 / 255, green: 112 / 255, blue: 72 / 255))
                        .padding()
                    Spacer()
                }
                
                
                VStack(spacing: 15) {
                    Text("How are you feeling today?")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(red: 90 / 255, green: 70 / 255, blue: 61 / 255))
                    
                    Text("+ Add Today’s Mood")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 198 / 255, green: 112 / 255, blue: 72 / 255))
                }
                
                
                ZStack {
                    Image("quoteImage")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .cornerRadius(16)
                        .clipped()
                    
                    Text("“Even the darkest night will end, and the sun will rise”")
                        .font(.system(size: 15, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 187 / 255, green: 159 / 255, blue: 82 / 255))
                    
                }
                .padding(.horizontal, 20)
                
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            VStack {
                                Text("July 12")
                                    .padding()
                                Text("🔥")
                            }
                            VStack {
                                Text("July 13")
                                    .padding()
                                Text("🔥")
                            }
                            VStack {
                                Text("July 14")
                                    .padding()
                                Text("🔥")
                            }
                            VStack {
                                Text("July 15")
                                    .padding()
                                Text("+")
                            }
                            VStack {
                                Text("July 16")
                                    .padding()
                                Text("+")
                            }
                            VStack {
                                Text("July 17")
                                    .padding()
                                Text("+")
                            }
                        }
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(red: 90/255, green: 70/255, blue: 61/255))
                        .padding(.horizontal)
                    }
                    .frame(height: 100)
                    
                    
                    HStack(spacing:5){
                        Text("That's three days in a row! Keep going")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color(red: 198/255, green: 112/255, blue: 72/255))
                        Text("🔥")
                            .font(.system(size: 15))
                    }
                    .padding(.top, 10)
                    .padding(.horizontal,5)
                    
                }
                
                VStack(spacing: 10) {
                    Text("This week!")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(red: 90 / 255, green: 70 / 255, blue: 61 / 255))
                    
                    Text("Look how far you came this week")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(red: 187 / 255, green: 159 / 255, blue: 82 / 255))
                        .padding(.bottom,25)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            VStack(spacing: 5) {
                                Text("Sun")
                                Text("😄")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                            
                            VStack {
                                Text("Mon")
                                Text("😁")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                            VStack {
                                Text("Tue")
                                Text("🙂")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                            VStack {
                                Text("Wed")
                                Text("+")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                            VStack {
                                Text("Thu")
                                Text("+")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                            VStack {
                                Text("Fri")
                                Text("+")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                            VStack {
                                Text("Sat")
                                Text("+")
                            }
                            .frame(width: 75, height: 95)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 90/255, green: 70/255, blue: 61/255),lineWidth: 2))
                        }
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(Color(red: 90/255, green: 70/255, blue: 61/255))
                        .padding(.horizontal)
                    }
                    .frame(height: 100)
                    
                    Spacer()
                }
                
               
                
                
            }
        }
    }
}


#Preview {
    HomeView()
}
