//
//  VoiceRecordingProgressView.swift
//  meditation
//
//  Progress indicator for recording
//

import SwiftUI

struct VoiceRecordingProgressView: View {
    let progress: Double
    let label: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(label)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(AppTheme.textMuted)
                
                Spacer()
                
                Text("\(Int(progress * 100))%")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(AppTheme.textSecondary)
            }
            
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.white.opacity(0.06))
                    .frame(height: 8)
                
                Capsule()
                    .fill(AppTheme.celestialBlue.opacity(0.8))
                    .frame(width: max(6, CGFloat(progress) * 280), height: 8)
                    .animation(.easeInOut(duration: 0.2), value: progress)
            }
        }
        .padding(16)
        .glass(intensity: 0.05, cornerRadius: 16)
    }
}

#Preview {
    VoiceRecordingProgressView(progress: 0.35, label: "Sample progress")
}
