//
//  ADTimerViewModel.swift
//  AcidDrumz
//
//  Created by Dave Gumba on 2025-07-01.
//

import Foundation
import SwiftUI
import Combine

enum Phase {
    case work, rest, inactive, sessionDone
}

final class TimerViewModel: ObservableObject {
    @Published var elapsedSeconds: Duration = .seconds(0)
    @Published var elapsedMilliseconds: Int = 0
    @Published var isTimerOnPlay: Bool = false
    
    private var cancellable: Cancellable?
    
    private var currentPhase: Phase = .work
    
    init() {
        
    }
    
    var shouldShowCancelButton: Bool {
        !isTimerOnPlay
    }
    
    func activateTimer() {
        self.currentPhase = .work
        playTimer()
    }
    
    func toggleTimer() {
        isTimerOnPlay ? pauseTimer() : playTimer()
    }
    
    func isTimerActive() -> Bool {
        return !(currentPhase == .inactive)
    }
    
    func isSessionOver() -> Bool {
        return currentPhase == .sessionDone
    }
    
    func resetPhase() {
        currentPhase = .work
    }
    
    private func pauseTimer() {
        cancellable?.cancel()
        isTimerOnPlay = false
    }
    
    private func playTimer() {
        isTimerOnPlay = true
        cancellable = Timer.publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink {
                _ in
                self.incrementTimer()
                // TODO: The sound logic would go here I think
                // how do we do this given sounds, a 16-item array, and a bpm?
            }
    }
    
    private var durationSeconds: Duration = .seconds(0)
    private var shouldStopTimer: Bool {
        .milliseconds(elapsedMilliseconds) >= durationSeconds
    }
    
    private func handleRoundCompletion() {
        if currentPhase == .work {
            switchToRestPhase()
        } else if currentPhase == .rest {
            moveToNextRoundOrStop()
        }
    }
    
    private func switchToRestPhase() {
        currentPhase = .rest
        // durationSeconds = .seconds(timerData.restDuration)
        
    }
    
    func stopAndResetTimer() {
        pauseTimer()
        //timerData.reset()
        resetElapsedTime()
        currentPhase = .sessionDone
        
        // playStartEndTimerSound()
    }
    
    private func resetElapsedTime() {
        elapsedMilliseconds = 0
        elapsedSeconds = .seconds(0)
    }
    
    private func moveToNextRoundOrStop() {
        stopAndResetTimer()
    }
    
    private func incrementTimer() {
        if elapsedMilliseconds % 1000 == 0 {
            withAnimation(.easeInOut) {
                if elapsedSeconds < durationSeconds {
                    elapsedSeconds += .seconds(1)
                }
                if shouldStopTimer {
                    handleRoundCompletion()
                }
            }
        }
        if !shouldStopTimer {
            elapsedMilliseconds += 10
        }
    }
}
