//
//  SwiftUIView.swift
//  
//
//  Created by Henri Bredt on 24.04.22.
//

import SwiftUI

struct WelcomePlaygroundView: View {
    
    // manage user progress
    @ObservedObject var appState: AppState
  @State var challengeChecked: Bool = false
  @Environment(\.colorScheme) var colorScheme
    
    
    /// currently opend page
    var currentPage : Page {
        BasicsCourse[appState.currentPage]
    }
    
    var body: some View {
        VStack{
          // 챌린지 배경 + 사진 Start
          if (!challengeChecked) { // 챌린지 완료 전 (기본)
            ZStack {
              Color(UIColor.systemBackground)
              VStack {
                Spacer(minLength: 45)
                Image("sightSpaceExample")
                  .resizable()
                  .renderingMode(.template)
                  .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                  .scaledToFit()
                  .frame(width: 250, height: 250, alignment: .center)
                  .padding(.bottom, 50)
              }
            }
          }
          else {
            ZStack { // 챌린지 후 (버튼 클릭된 상태)
              Color(UIColor.systemBackground).colorInvert()
              VStack {
                Spacer(minLength: 45)
                Image("sightSpaceExample")
                  .resizable()
                  .renderingMode(.template)
                  .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
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
                
                Spacer()
            }
            
            HStack{
                if !appState.completionProgress.contains(currentPage.id) {
                    Button {
                        /// currently opend page
                        let currentPage = BasicsCourse[appState.currentPage]
                        // Mark lesson as completed
                        appState.appendToCompletionProgress(id: currentPage.id)
                      challengeChecked.toggle()
                    } label: {
                        Text("Got it")
                            .padding(12)
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .background(Color.accentColor.opacity(0.1))
                            .cornerRadius(10)
                            .transition(.scale.combined(with: .opacity))
                    }
                    
                } else {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.green)
                        .frame(width: 40, height: 40)
                        .padding(5)
                        .padding(.trailing, 4)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .animation(Animation.timingCurve(0.44, 1.86, 0.61, 0.99, duration: 0.5), value: appState.completionProgress)
            
        }
        .animation(Animation.timingCurve(0.16, 0.9, 0.51, 1, duration: 0.3), value: appState.completionProgress)
    }
}

