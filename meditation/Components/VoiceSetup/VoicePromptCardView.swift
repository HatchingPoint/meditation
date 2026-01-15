//
//  VoicePromptCardView.swift
//  meditation
//
//  Prompt card for voice recording
//

import SwiftUI

struct VoicePromptCardView: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(AppTheme.textMuted)
                .textCase(.uppercase)
                .tracking(1)
            
            Text(text)
                .font(.system(size: 15, weight: .light, design: .serif))
                .foregroundColor(AppTheme.textPrimary)
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .glass(intensity: 0.05, cornerRadius: 16)
    }
}

#Preview {
    VoicePromptCardView(
        title: "Prompt 1",
        text: "Find a comfortable position. Take a slow breath in through the nose, and release it gently."
    )
}
