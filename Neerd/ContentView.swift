//
//  ContentView.swift
//  NerdAMathGame
//
//  Created by Albert Niklasson on 2024-11-26.
//

import SwiftUI

struct ContentView: View {
    
    
@State var button = ButtonTasks()
    
    
    var body: some View { 
        
        VStack(spacing: 0) {
            VStack(spacing: 0) {
                // Lives and time
                VStack {
                    HStack {
                        HStack{
                            Text("Time:")
                            Spacer()
                            
                        }.frame(maxWidth: .infinity)
                            .customFont(15).padding(.bottom, 10)
                        HStack {
                            Text("Lives: ")
                            Spacer()
                        }.frame(maxWidth: .infinity)
                            .customFont(15).padding(.bottom, 10)
                    }.padding(.horizontal, 20)
                    HStack {
                        HStack{
                            Text("\(button.timeRemaining)").customFont(20)
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        
                        
                        HStack {
                            if button.lives > 0 {
                                ForEach(1...button.lives, id: \.self) { hearts in
                                        Image("heart")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                
                            } else {
                                Text("Game over")
                            }
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        
                    }.frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                
                        
                    Spacer()
 
                }
                .frame(height: 75)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.gray)
                
                
                VStack {
                    // Correct or wrong answer
                    HStack {
                        if let choice = button.correctChoice {
                            Text(choice == 1 ? "Rätt" : "Fel")
                                .customFont(20)
                                .foregroundColor(choice == 1 ? .green : .red)
                            
                        }
                    }
                    .padding(.top, 20)
                        
                    
                    // Numbers to multiply
                    Spacer()
                    HStack{
                        HStack{
                            Text(button.randomFirst.formatted())
                        }
                        HStack{
                            Text(" * ")
                        }
                        HStack{
                            Text(button.randomSecond.formatted())
                        }
                    }.customFont(40)
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                    .background(Color.cyan)
                    .border(Color.black)
                
                VStack {
                   

                    
                    
                    
                    VStack {
                        ForEach(1...3, id: \.self) { row in
                            HStack(spacing: 0) {
                                ForEach(1...3, id: \.self) { column in
                                    let index = (row - 1) * 3 + (column - 1)
        
                                    ButtonView(button: button, index: index)
                                }
                            }
                        }

                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                
                    
                }
                
                    
                    
                    HStack {
                        
                            Spacer()
                        
                        Button(action: {
                            button.startNewRound()
                        }) {
                            ZStack {
                                
                                Image("buttonNormal")
                                Image(systemName: "arrow.counterclockwise.circle.fill")
                                    .foregroundColor(Color.white)
                                    .customFont(30)
                                    .padding(.bottom, 10)
                               
                            }
                        }
                            Button(action: {
                                button.isTimerOn = true
                            }) {
                                ZStack {
                                    
                                    Image("buttonNormal")
                                    Image(systemName: "play.fill")
                                        .foregroundColor(Color.white)
                                        .customFont(30)
                                        .padding(.bottom, 10)
                                   
                                }
                            }
                        
                        Button(action: {
                            button.isTimerOn = false
                        }) {
                            ZStack {
                                
                                Image("buttonNormal")
                                Image(systemName: "pause.fill")
                                    .foregroundColor(Color.white)
                                    .customFont(30)
                                    .padding(.bottom, 10)
                               
                            }
                        }
                        
                        
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(Color.gray)
                    
                }
                
            

        }
        .onReceive(button.timer) { time in
            if button.timeRemaining > 0 && button.isTimerOn == true {
                button.timeRemaining -= 1
            } else {
                button.ifTimeRunsOut()
            }
        }
    }
    
    
}

#Preview {
    ContentView()
}
