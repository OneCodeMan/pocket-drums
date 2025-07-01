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
    
    // Sound-related properties
    private var sounds: [Int] = [1, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0] // 16th notes pattern
    private var bpm: Double = 120 // beats per minute
    private var currentSoundIndex: Int = 0
    private var lastSoundTriggerTime: TimeInterval = 0
    
    init() {
        
    }
    
    var shouldShowCancelButton: Bool {
        !isTimerOnPlay
    }
    
    // Computed property for 16th note interval in milliseconds
    private var sixteenthNoteInterval: Double {
        // BPM is quarter notes per minute
        // 16th notes are 4x faster than quarter notes
        // Convert to milliseconds: (60 seconds / BPM) / 4 * 1000
        return (60.0 / bpm) / 4.0 * 1000.0
    }
    
    func setBPM(_ newBPM: Double) {
        bpm = max(60, min(200, newBPM)) // Clamp BPM between reasonable values
    }
    
    func setSoundsPattern(_ newSounds: [Int]) {
        guard newSounds.count == 16 else {
            print("Sound pattern must be exactly 16 elements")
            return
        }
        sounds = newSounds
    }
    
    func activateTimer() {
        self.currentPhase = .work
        resetSoundState()
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
        resetSoundState()
    }
    
    private func resetSoundState() {
        currentSoundIndex = 0
        lastSoundTriggerTime = 0
    }
    
    private func pauseTimer() {
        cancellable?.cancel()
        isTimerOnPlay = false
    }
    
    private func playTimer() {
        isTimerOnPlay = true
        cancellable = Timer.publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.incrementTimer()
                self.handleSoundLogic()
            }
    }
    
    private var durationSeconds: Duration = .seconds(0)
    private var shouldStopTimer: Bool {
        .milliseconds(elapsedMilliseconds) >= durationSeconds
    }
    
    private func handleSoundLogic() {
        let currentTime = TimeInterval(elapsedMilliseconds)
        let timeSinceLastSound = currentTime - lastSoundTriggerTime
        
        // Check if it's time to trigger the next 16th note
        if timeSinceLastSound >= sixteenthNoteInterval {
            let soundValue = sounds[currentSoundIndex]
            
            // Only play sound if the value is not 0
            if soundValue != 0 {
                playSound(soundValue)
            }
            
            // Move to next sound in the pattern
            currentSoundIndex = (currentSoundIndex + 1) % sounds.count
            lastSoundTriggerTime = currentTime
        }
    }
    
    private func playSound(_ soundValue: Int) {
        // TODO: Implement actual sound playing logic here
        // This is where you'd trigger your audio engine/samples
        print("Playing sound: \(soundValue) at time: \(elapsedMilliseconds)ms, index: \(currentSoundIndex)")
        
        // Example of what this might look like:
        // switch soundValue {
        // case 1:
        //     audioEngine.playKick()
        // case 2:
        //     audioEngine.playSnare()
        // case 3:
        //     audioEngine.playHiHat()
        // default:
        //     break
        // }
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
        resetSoundState()
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

// MARK: - Usage Example
extension TimerViewModel {
    func setupDrumPattern() {
        // Example drum patterns
        let kickAndSnarePattern = [1, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 2, 0, 0, 0]
        let complexPattern = [1, 0, 3, 0, 2, 0, 3, 1, 0, 3, 0, 0, 2, 0, 3, 0]
        
        setSoundsPattern(kickAndSnarePattern)
        setBPM(120) // Standard tempo
    }
}
