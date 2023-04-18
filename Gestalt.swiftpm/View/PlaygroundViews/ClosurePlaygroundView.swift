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
  // Image hidden boolean
  @State private var packmanOpacityOne = 0.0
  @State private var packmanOpacityTwo = 0.0
  @State private var packmanOpacityThree = 0.0
  @State private var triangleOpacityOne = 0.0
  @State private var triangleOpacityTwo = 0.0
  @State private var triangleOpacityThree = 0.0
  // button count
  @State private var buttonTapCount = 0
  // animation value
  @State private var isVisible = false
  // image color
  @State private var packmanColor = Color(UIColor(.yellow))
  @State private var triangleColor = Color(UIColor(.gray))
  
  var body: some View { // body Start
    HStack {
      Spacer()
      VStack{ // VStack Start
        HStack {
          Image("packman_1")
            .renderingMode(.template)
            .foregroundColor(packmanColor)
            .opacity(packmanOpacityOne)
          Spacer()
            .frame(width: 40)
          VStack {
            Image("triangle_1")
              .renderingMode(.template)
              .foregroundColor(triangleColor)
              .opacity(triangleOpacityOne)
            Spacer()
              .frame(height: 70)
          }
          Spacer()
            .frame(width: 40)
          Image("packman_2")
            .renderingMode(.template)
            .foregroundColor(packmanColor)
            .opacity(packmanOpacityTwo)
        }
        .animation(.easeInOut(duration: 1.0), value: isVisible)
        HStack {
          Image("triangle_2")
            .renderingMode(.template)
            .foregroundColor(triangleColor)
            .opacity(triangleOpacityTwo)
          Spacer()
            .frame(width: 70)
          Image("triangle_3")
            .renderingMode(.template)
            .foregroundColor(triangleColor)
            .opacity(triangleOpacityThree)
        }
        .animation(.easeInOut(duration: 1.0), value: isVisible)
        Spacer()
          .frame(height: 40)
        Image("packman_3")
          .renderingMode(.template)
          .foregroundColor(packmanColor)
          .opacity(packmanOpacityThree)
          .animation(.easeInOut(duration: 1.0), value: isVisible)
        Spacer()
          .frame(height: 30)
        
        if (buttonTapCount < 6) {
          Button { // button start
            buttonTapCount += 1
            switch (buttonTapCount) {
            case 1:
              triangleOpacityTwo = 1.0
              isVisible.toggle()
            case 2:
              packmanOpacityTwo = 1.0
              isVisible.toggle()
            case 3:
              packmanOpacityOne = 1.0
              isVisible.toggle()
            case 4:
              triangleOpacityOne = 1.0
              isVisible.toggle()
            case 5:
              packmanOpacityThree = 1.0
              isVisible.toggle()
            case 6:
              triangleOpacityThree = 1.0
              isVisible.toggle()
              checkChallengeCompleted()
            default:
              print("default")
            }
          } label: {
            Text("Tap It!")
              .font(.callout)
              .foregroundColor(.white)
              .fontWeight(.medium)
          }
          .padding(13)
          .background(Color.blue)
          .cornerRadius(20) // button end
        } else {
          Image(systemName: "checkmark.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.green)
            .frame(width: 50, height: 50)
            .padding(5)
            .transition(.scale.combined(with: .opacity))
        }
      }
      .onChange(of: kerning) { newValue in
        checkChallengeCompleted()
      }
      .onChange(of: fontSize) { newValue in
        checkChallengeCompleted()
      } // Vstack End
    Spacer()
    }
  } // body End
  
  func checkChallengeCompleted(){
    if (buttonTapCount >= 6) {
      /// currently opend page
      let currentPage = BasicsCourse[appState.currentPage]
      // Mark lesson as completed
      appState.appendToCompletionProgress(id: currentPage.id)
    }
  }
}

