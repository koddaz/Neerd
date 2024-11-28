//
//  ButtonView.swift
//  Neerd
//
//  Created by Albert Niklasson on 2024-11-28.
//

import SwiftUI

struct ButtonView: View {
    
    @State var button = ButtonTasks()
    let index: Int
    
    var body: some View {

        Button(action: {
                    button.pressedButtonIndex = index
                    button.checkAnswer(selectedIndex: index)
                    button.afterAnswerRound()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        button.pressedButtonIndex = nil // Återställ tryckläget
                    }
                }) {
                    ZStack {
                        Image(button.pressedButtonIndex == index ? "ButtonPressed" : "buttonNormal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .offset(y: button.pressedButtonIndex == index ? 5 : 0) // Nedåt rörelse vid tryck
                            .animation(.easeInOut(duration: 0.1), value: button.pressedButtonIndex == index)

                        Text(button.buttonText(for: index))
                            .frame(maxWidth: 100)
                            .padding(.bottom, 5)
                            .customFont(15)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .offset(y: button.pressedButtonIndex == index ? 5 : 0) // Nedåt rörelse vid tryck
                            .animation(.easeInOut(duration: 0.1), value: button.pressedButtonIndex == index)
                    }
                }
                .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ButtonView(index: 4)
}
