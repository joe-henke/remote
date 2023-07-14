//
//  LetterButton.swift
//  Remote
//
//  Created by Joe Henke on 7/13/23.
//

import SwiftUI

struct LetterButton: View {
  @EnvironmentObject private var appState: AppState
  var row: Int
  var col: Int
  var body: some View {
    let isActive = appState.currentRow == row && appState.currentColumn == col
    let strokeOpacity  = isActive ? 1.0 : 0.4
    let color = isActive ? Color.red : Color.green
    Button {} label: {
      Text(appState.letters[row][col])
        .background()
        .frame(width: 48, height: 48)
    }
    .background(
      RoundedRectangle(cornerRadius: appState.corner)
        .stroke(color.opacity(strokeOpacity), lineWidth: 1)
    )
  }
}

struct LetterButton_Previews: PreviewProvider {
  static var previews: some View {
    let appState = AppState()
    LetterButton(row: 0, col: 0).environmentObject(appState)
  }
}
