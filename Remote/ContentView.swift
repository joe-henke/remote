//
//  ContentView.swift
//  Remote
//
//  Created by Joe Henke on 7/13/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var appState = AppState()
  var body: some View {
    VStack {
      Spacer()
      TermRow()
      Spacer()
      GridView()
      Spacer()
      HStack {
        DirectionButton(move: .left)
        VStack {
          DirectionButton(move: .up)
          DirectionButton(move: .enter)
          DirectionButton(move: .down)
        }
        DirectionButton(move: .right)
      }
      Spacer()
    }
    .environmentObject(appState)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let appState = AppState()
    ContentView().environmentObject(appState)
  }
}
