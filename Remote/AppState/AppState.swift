//
//  AppState.swift
//  Remote
//
//  Created by Joe Henke on 7/13/23.
//

import Combine
import Foundation

enum Move: String {
  case up, down, left, right, enter

  var icon: String {
    switch self {
    case .up, .down, .left, .right:
      return "arrow." + self.rawValue
    case .enter:
      return "return.left"
    }
  }
}

enum ColumnResolveType {
  case clamp, skip
}

class AppState: ObservableObject {
  @Published var currentRow = 0
  @Published var currentColumn = 0
  @Published var move: Move = .up
  @Published var currentTerm: String = ""
  @Published var corner: CGFloat = 10
  var columnResolveType: ColumnResolveType = .skip

  let letters = [
    ["a", "b", "c", "d", "e"],
    ["f", "g", "h", "i", "j"],
    ["k", "l", "m", "n", "o"],
    ["p", "q", "r", "s", "t"],
    ["u", "v", "w", "x", "y"],
    ["z", "spc", "del"]
  ]

  func move(_ move: Move) {
    switch move {
    case .up:
      currentRow = wrapIndex(count: letters.count, idx: currentRow - 1)
      columnResolveType == .clamp ? columnClamp() : skipUp()
    case .down:
      currentRow = wrapIndex(count: letters.count, idx: currentRow + 1)
      columnResolveType == .clamp ? columnClamp() : skipDown()
    case .left:
      currentColumn = wrapIndex(count: letters[currentRow].count, idx: currentColumn - 1)
    case .right:
      currentColumn = wrapIndex(count: letters[currentRow].count, idx: currentColumn + 1)
    case .enter:
      let value = letters[currentRow][currentColumn]
      if value == "spc" {
        currentTerm += " "
      } else if value == "del" {
        currentTerm = ""
      } else {
        currentTerm += letters[currentRow][currentColumn]
      }
    }
  }

  private func wrapIndex(count: Int, idx: Int) -> Int {
    let length = count - 1
    return idx > length ? 0 :
      idx < 0 ? length :
      idx
  }

  private func columnResolve() {
    switch columnResolveType {
    case .clamp:
      columnClamp()
    case .skip:
      move == .up ? skipUp() : skipDown()
    }
  }

  private func columnClamp() {
    let length = letters[currentRow].count - 1
    currentColumn = currentColumn > length ? length : currentColumn
  }

  private func skipDown() {
    while currentColumn > letters[currentRow].count - 1 {
      currentRow = wrapIndex(count: letters.count, idx: currentRow + 1)
    }
  }
  
  private func skipUp() {
    while currentColumn > letters[currentRow].count - 1 {
      currentRow = wrapIndex(count: letters.count, idx: currentRow - 1)
    }
  }
}
