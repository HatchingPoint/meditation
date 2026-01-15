//
//  VoiceRecordingControlsView.swift
//  meditation
//
//  Record/stop controls
//

import SwiftUI

struct VoiceRecordingControlsView: View {
    let isListening: Bool
    let onRecordTap: () -> Void
    let onStopTap: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Button(action: onRecordTap) {
                HStack(spacing: 10) {
                    Image(systemName: "record.circle")
                    Text("Record")
                }
                .etherealButton(isEnabled: !isListening, style: .primary)
            }
            .disabled(isListening)
            
            Button(action: onStopTap) {
                HStack(spacing: 10) {
                    Image(systemName: "stop.circle")
                    Text("Stop")
                }
                .etherealButton(isEnabled: isListening, style: .secondary)
            }
            .disabled(!isListening)
        }
    }
}

#Preview {
    VoiceRecordingControlsView(isListening: false, onRecordTap: {}, onStopTap: {})
}
