//
//  ButtonTasks.swift
//  Neerd
//
//  Created by Albert Niklasson on 2024-11-28.
//

import Foundation
import SwiftUI

@Observable class ButtonTasks {
    
    var timeRemaining = 10
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var isTimerOn = false
    var randomFirst = Int.random(in: 1...10)
    var randomSecond = Int.random(in: 1...10)
    var randomPlace = Int.random(in: 0...8) // Adjusted to fit array indexing
    var correctAnswer = 0
    var correctChoice: Int? = nil
    var lives = 3
    var pressedButtonIndex: Int? = nil
    var isPressed = false
    
func ifTimeRunsOut() {
    if lives > 0 {
        timeRemaining = 10
        isTimerOn = true
        lives -= 1
    } else {
        return
    }

    }
func afterAnswerRound() {
        randomFirst = Int.random(in: 1...10)
        randomSecond = Int.random(in: 1...10)
        correctAnswer = randomFirst * randomSecond
        randomPlace = Int.random(in: 1...3)
        isPressed = true
        // correctChoice = nil
        timeRemaining = 10
        isTimerOn = true
    }


func startNewRound() {
        lives = 3
        randomFirst = Int.random(in: 1...10)
        randomSecond = Int.random(in: 1...10)
        correctAnswer = randomFirst * randomSecond
        randomPlace = Int.random(in: 1...3)
        correctChoice = nil
        timeRemaining = 10
        isTimerOn = true
    }

    /// Determines the button text for a given index
func buttonText(for index: Int) -> String {
        if index == randomPlace {
            return "\(correctAnswer)"
        } else if index == 1 {
            return "\(correctAnswer + 1)"
        } else if index == 2 {
            return "\(correctAnswer + 2)"
        } else if index == 3 {
            return "\(correctAnswer + 3)"
        } else if index == 4 {
            return "\(correctAnswer + 4)"
        } else if index == 5 {
            return "\(correctAnswer + 5)"
        } else if index == 6 {
            return "\(correctAnswer + 6)"
        } else if index == 7 {
            return "\(correctAnswer + 7)"
        } else if index == 8 {
            return "\(correctAnswer + 8)"
        }

        else {
            return "\(correctAnswer + 9)"
        }
        
    }

    /// Checks if the selected answer is correct
func checkAnswer(selectedIndex: Int) {
        if selectedIndex == randomPlace {
            correctChoice = 1  // Correct
        } else {
            correctChoice = 2  // Incorrect
            if lives > 0 {
                lives -= 1
            }
        }
    }
}
