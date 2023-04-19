//
//  CommonFatePlaygroundView.swift
//  
//
//  Created by 박의서 on 2023/04/17.
//

import SwiftUI

struct CommonFatePlaygroundView: View {
  
  // manage user progress
  @ObservedObject var appState: AppState
  // Position variables
  @State private var position = CGPoint(x: 450, y: 70)
  
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(UIColor.systemBackground))
      VStack{
        Spacer()
          .frame(height: 30)
        HStack {
          Spacer()
          Image("airplanes")
            .renderingMode(.template)
            .tint(.mint) // ?? 색 뭐임
            .position(position) // 현재 위치로 이미지를 배치
          Spacer()
        }
        Spacer()
          .frame(height: 30)
      }
    }
    .onTapGesture { location in
      print("Tapped at \(location)")
      withAnimation(.easeInOut(duration: 1.5)) {
        position = CGPoint(x: location.x - 70, y: location.y + 50)
      }
    }
  }
  
  func checkChallengeCompleted(){
    /// currently opend page
    let currentPage = BasicsCourse[appState.currentPage]
    // Mark lesson as completed
    appState.appendToCompletionProgress(id: currentPage.id)
  }
  
  
}

