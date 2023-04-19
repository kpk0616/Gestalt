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
  @State private var checkMarkOpacity = 0.0
  
  @State private var position = CGPoint(x: 450, y: 70)
  @State private var rotationAngle: Angle = .zero
  @State private var animationBoolean = false
  
  
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(hex: 0x363350))
      VStack{
        Spacer()
          .frame(height: 30)
        HStack {
          Spacer()
          Image("birds")
            .renderingMode(.template)
            .foregroundColor(Color(hex: 0xEBFF00))
            .rotationEffect(rotationAngle, anchor: .topLeading)
            .position(position) // 현재 위치로 이미지를 배치
          Spacer()
        }
        Spacer()
          .frame(height: 30)
        Image(systemName: "checkmark.circle.fill")
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.yellow)
          .frame(width: 50, height: 50)
          .padding(5)
          .opacity(checkMarkOpacity)
          .transition(.scale.combined(with: .opacity))
          .animation(.easeInOut(duration: 1.0), value: animationBoolean)
      }
    }
    .onTapGesture { location in
      checkCommonFateChallengeCompleted()
      withAnimation(.easeInOut(duration: 1.5)) {
        position = CGPoint(x: location.x - 70, y: location.y + 50)
        if location.x < 450 {
          rotationAngle = .degrees(-90)
          position.x += 130
          position.y += 180
        }
        else {
          rotationAngle = .zero
        }
      } // withAnimation end
    } // onTapGesture End
  } // body end
  
  private func checkCommonFateChallengeCompleted(){
    /// currently opend page
    let currentPage = BasicsCourse[appState.currentPage]
    // Mark lesson as completed
    appState.appendToCompletionProgress(id: currentPage.id)
    animationBoolean.toggle()
    checkMarkOpacity = 1.0
  }
}

