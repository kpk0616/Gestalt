//
//  ClosurePlaygroundView.swift
//  
//
//  Created by 박의서 on 2023/04/17.
//

import SwiftUI

struct ClosurePlaygroundView: View {
  
  // manage user progress
  @ObservedObject var appState: AppState
  
  @State private var kerning = -6.0
  @State private var fontSize = 80.0
  
  var body: some View {
    VStack{
      Spacer()
      Text("Hello!")
        .bold()
        .font(.system(size: fontSize))
        .kerning(kerning)
      Spacer()
      
      Button {
        
      } label: {
        Spacer()
        Text("Tap It!")
          .font(.callout)
          .foregroundColor(.white)
          .fontWeight(.medium)
        Spacer()
      }
      .buttonStyle(.bordered)
      .tint(.blue)
      .padding(13)
    }
    .onChange(of: kerning) { newValue in
      checkChallengeCompleted()
    }
    .onChange(of: fontSize) { newValue in
      checkChallengeCompleted()
    }
  }
  
  func checkChallengeCompleted(){
    if (kerning > 1 && kerning < 3) && (fontSize > 55 && fontSize < 65) {
      /// currently opend page
      let currentPage = BasicsCourse[appState.currentPage]
      // Mark lesson as completed
      appState.appendToCompletionProgress(id: currentPage.id)
    }
  }
}

