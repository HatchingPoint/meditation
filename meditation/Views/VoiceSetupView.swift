//
//  VoiceSetupView.swift
//  meditation
//
//  Placeholder for voice capture flow
//

import SwiftUI

struct VoiceSetupView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var isListening = false
    @State private var progress: Double = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background1
                    .ignoresSafeArea()
                
                EtherealBackgroundView()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        VStack(spacing: 12) {
                            Text("Set Up Your Voice")
                                .font(.system(size: 28, weight: .light, design: .serif))
                                .foregroundColor(AppTheme.pearl)
                            
                            Text("Record a short sample to capture your tone and pacing.")
                                .font(.system(size: 14, weight: .light))
                                .foregroundColor(AppTheme.textSecondary)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 40)
                        
                        VoiceListeningAnimationView(isListening: isListening)
                            .padding(.top, 8)
                        
                        VoiceSetupStatusView(
                            title: isListening ? "Listening..." : "Ready to Record",
                            detail: isListening
                                ? "Speak naturally. We are grading clarity and pacing."
                                : "Tap record and read the prompt below."
                        )
                        
                        VoicePromptCardView(
                            title: "Prompt 1",
                            text: "Find a comfortable position. Take a slow breath in through the nose, and release it gently."
                        )
                        
                        VoiceRecordingProgressView(
                            progress: progress,
                            label: "Sample progress"
                        )
                        
                        VoiceRecordingControlsView(
                            isListening: isListening,
                            onRecordTap: startRecording,
                            onStopTap: stopRecording
                        )
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("What you'll record")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(AppTheme.textPrimary)
                            
                            Text("You'll read a few short paragraphs designed to capture your tone and pacing.")
                                .font(.system(size: 13, weight: .light))
                                .foregroundColor(AppTheme.textSecondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                        .glass(intensity: 0.05, cornerRadius: 16)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 60)
                }
            }
            .navigationTitle("Voice Setup")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                    .foregroundColor(AppTheme.textSecondary)
                }
            }
        }
    }
    
    private func startRecording() {
        isListening = true
        progress = 0.0
        simulateProgress()
    }
    
    private func stopRecording() {
        isListening = false
        progress = 1.0
    }
    
    private func simulateProgress() {
        Task {
            for step in 1...20 {
                try? await Task.sleep(nanoseconds: 150_000_000)
                guard isListening else { return }
                progress = Double(step) / 20.0
            }
            isListening = false
        }
    }
}

#Preview {
    VoiceSetupView()
}

