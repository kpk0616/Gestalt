//
//  SwiftUIView.swift
//  
//
//  Created by 박의서 on 2023/04/19.
//

import SwiftUI

struct WelcomePlaygroundView: View {
  
  // manage user progress
  @ObservedObject var progressState: ProgressState
  @State var challengeChecked: Bool = false
  @Environment(\.colorScheme) var colorScheme
  
  
  /// currently opend page
  var currentPage : Page {
    lessons[progressState.currentPage]
  }
  
  var body: some View {
    VStack{
      // 챌린지 배경 + 사진 Start
      if (!challengeChecked) { // 챌린지 완료 전 (기본)
        ZStack {
          Color(hex: 0x363350)
          VStack {
            Spacer(minLength: 45)
            Image("sightSpaceExample")
              .resizable()
              .renderingMode(.template)
              .foregroundColor(.white)
              .scaledToFit()
              .frame(width: 250, height: 250, alignment: .center)
              .padding(.bottom, 50)
          }
        }
      }
      else {
        ZStack { // 챌린지 후 (버튼 클릭된 상태)
          Color(.white)
          VStack {
            Spacer(minLength: 45)
            Image("sightSpaceExample")
              .resizable()
              .renderingMode(.template)
              .foregroundColor(Color(hex:0x363350))
              .scaledToFit()
              .frame(width: 250, height: 250, alignment: .center)
              .padding(.bottom, 50)
          }
        }
      }
      // 챌린지 배경 + 사진 End
      HStack{
        Spacer()
        Text("This is the playground view where you will be soving the callenges.")
          .multilineTextAlignment(.center)
          .padding(.bottom, 20)
          .foregroundColor(.white)
        
        Spacer()
      }
      
      HStack{
        if !progressState.completionProgress.contains(currentPage.id) {
          Button {
            /// currently opend page
            let currentPage = lessons[progressState.currentPage]
            // Mark lesson as completed
            progressState.appendToCompletionProgress(id: currentPage.id)
            challengeChecked.toggle()
          } label: {
            Text("Tap it")
              .padding(12)
              .padding(.leading, 15)
              .padding(.trailing, 15)
              .background(Color(hex: 0x696682))
              .cornerRadius(10)
              .foregroundColor(.yellow)
              .transition(.scale.combined(with: .opacity))
          }
          
        } else {
          Image(systemName: "checkmark.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.yellow)
            .frame(width: 40, height: 40)
            .padding(5)
            .padding(.trailing, 4)
            .transition(.scale.combined(with: .opacity))
        }
      }
      .animation(Animation.timingCurve(0.44, 1.86, 0.61, 0.99, duration: 0.5), value: progressState.completionProgress)
      
    }
    .animation(Animation.timingCurve(0.16, 0.9, 0.51, 1, duration: 0.3), value: progressState.completionProgress)
  }
}

