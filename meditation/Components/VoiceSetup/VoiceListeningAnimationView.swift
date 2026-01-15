//
//  VoiceListeningAnimationView.swift
//  meditation
//
//  Animated listening indicator
//

import SwiftUI

struct VoiceListeningAnimationView: View {
    let isListening: Bool
    @State private var phase: CGFloat = 0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(AppTheme.pearl.opacity(0.08))
                .frame(width: 180, height: 180)
                .overlay(
                    Circle()
                        .stroke(AppTheme.pearl.opacity(0.12), lineWidth: 1)
                )
            
            ForEach(0..<3, id: \.self) { index in
                Circle()
                    .stroke(
                        AppTheme.celestialBlue.opacity(isListening ? 0.25 : 0.08),
                        lineWidth: 1
                    )
                    .frame(width: 120 + CGFloat(index) * 30, height: 120 + CGFloat(index) * 30)
                    .scaleEffect(isListening ? 1.0 + pulseOffset(for: index) : 1.0)
                    .animation(
                        .easeInOut(duration: 1.4).repeatForever(autoreverses: true),
                        value: phase
                    )
            }
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            AppTheme.pearl,
                            AppTheme.opal,
                            AppTheme.moonstone
                        ],
                        center: .topLeading,
                        startRadius: 0,
                        endRadius: 50
                    )
                )
                .frame(width: 70, height: 70)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(size: 26))
                        .foregroundColor(AppTheme.void)
                )
                .shadow(color: AppTheme.pearl.opacity(0.2), radius: 20)
        }
        .onAppear {
            phase = 1
        }
    }
    
    private func pulseOffset(for index: Int) -> CGFloat {
        guard isListening else { return 0 }
        return 0.02 + CGFloat(index) * 0.02
    }
}

#Preview {
    VoiceListeningAnimationView(isListening: true)
}
