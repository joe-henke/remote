//
//  DirectionButton.swift
//  Remote
//
//  Created by Joe Henke on 7/13/23.
//

import SwiftUI

struct DirectionButton: View {
  @EnvironmentObject private var appState: AppState
  var move: Move
  var body: some View {
    Button {
      appState.move(self.move)
    } label: {
      Image(systemName: move.icon)
    }
    .frame(width: 48, height: 64)
    .background(
      RoundedRectangle(cornerRadius: appState.corner)
        .stroke(Color.purple.opacity(0.4), lineWidth: 1)
    )
  }
}

struct DirectionButton_Previews: PreviewProvider {
  static var previews: some View {
    let appState = AppState()
    DirectionButton(move: .up).environmentObject(appState)
  }
}
