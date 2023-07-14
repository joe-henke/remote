//
//  GridView.swift
//  Remote
//
//  Created by Joe Henke on 7/13/23.
//

import SwiftUI

struct GridView: View {
  @EnvironmentObject private var appState: AppState
  var body: some View {
    Grid {
      ForEach(0..<appState.letters.count, id: \.self) { row in
        GridRow {
          ForEach(0..<appState.letters[row].count, id: \.self) { idx in
            LetterButton(row: row, col: idx)
          }
        }
      }
    }
  }
}

struct GridView_Previews: PreviewProvider {
  static var previews: some View {
    let appState = AppState()
    GridView().environmentObject(appState)
  }
}
