//
//  TermRow.swift
//  Remote
//
//  Created by Joe Henke on 7/13/23.
//

import SwiftUI

struct TermRow: View {
  @EnvironmentObject private var appState: AppState
  var body: some View {
    HStack {
      Text("Term:")
      Text(appState.currentTerm)
        .padding()
        .frame(width: 280, height: 43, alignment: .leading)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(appState.corner)
    }
  }
}

struct TermRow_Previews: PreviewProvider {
  static var previews: some View {
    let appState = AppState()
    TermRow().environmentObject(appState)
  }
}
