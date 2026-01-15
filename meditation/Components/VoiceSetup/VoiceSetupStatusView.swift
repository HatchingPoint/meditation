//
//  VoiceSetupStatusView.swift
//  meditation
//
//  Status card for voice setup
//

import SwiftUI

struct VoiceSetupStatusView: View {
    let title: String
    let detail: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(AppTheme.textPrimary)
            
            Text(detail)
                .font(.system(size: 13, weight: .light))
                .foregroundColor(AppTheme.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .glass(intensity: 0.05, cornerRadius: 16)
    }
}

#Preview {
    VoiceSetupStatusView(
        title: "Listening...",
        detail: "Speak naturally. We are grading clarity and pacing."
    )
}
