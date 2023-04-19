//
//  SwiftUIView.swift
//
//
//  Created by Henri Bredt on 24.04.22.
//

import SwiftUI

struct SimilarityContentCustomView: View {
  //  @ObservedObject var appState: AppState
  @State private var checkMarkOpacity = 0.0
  
  @State private var selectedType = 0
  // Circle variables
  @State private var circleDefaultSize = 70.0
  @State private var circleChangeSize = 70.0
  @State private var circleDefaultColor = Color(hex: 0x34EBF6)
  @State private var circleChangeColor = Color(hex: 0x34EBF6)
  @State private var animationBoolean = false
  @State private var changeShapeBoolean = false
  
  var body: some View {
    VStack { // VStack Start
      Picker("Favorite Color", selection: $selectedType, content: {
        Text("Default").tag(0)
        Text("Color").tag(1)
        Text("Shape").tag(2)
        Text("Size").tag(3)
      })
      .pickerStyle(SegmentedPickerStyle())
      .onChange(of: selectedType){ newValue in
        circleChangeSize = 70.0
        circleChangeColor = Color(hex: 0x34EBF6)
        changeShapeBoolean = false
        animationBoolean.toggle()
        
        switch newValue {
        case 0: // basic (default)
          print("basic")
        case 1: // color
          circleChangeColor = Color(hex: 0xD9EB07)
        case 2: // shape
          changeShapeBoolean = true
        case 3: // size
          circleChangeSize = 100.0
          checkSimilarityChallengeCompleted()
          
        default:
          print("default")
        }
      }
      VStack { // Inner VStack Start
        HStack { // HStack Start
          VStack {
            Spacer(minLength: 50)
            Circle()
              .frame(width: circleChangeSize, height: circleChangeSize)
              .padding(10)
              .foregroundColor(circleChangeColor)
            Circle()
              .frame(width: circleDefaultSize, height: circleDefaultSize)
              .padding(10)
              .foregroundColor(circleDefaultColor)
            Circle()
              .frame(width: circleDefaultSize, height: circleDefaultSize)
              .padding(10)
              .foregroundColor(circleDefaultColor)
            Spacer(minLength: 50)
          }
          VStack {
            Spacer(minLength: 50)
            Circle()
              .frame(width: circleDefaultSize, height: circleDefaultSize)
              .padding(10)
              .foregroundColor(circleChangeColor)
            if (!changeShapeBoolean) {
              Circle()
                .frame(width: circleChangeSize, height: circleChangeSize)
                .padding(10)
                .foregroundColor(circleDefaultColor)
              Circle()
                .frame(width: circleDefaultSize, height: circleDefaultSize)
                .padding(10)
                .foregroundColor(circleChangeColor)
            } else {
              Rectangle()
                .frame(width: circleChangeSize, height: circleChangeSize)
                .padding(10)
                .foregroundColor(circleDefaultColor)
              Rectangle()
                .frame(width: circleChangeSize, height: circleChangeSize)
                .padding(10)
                .foregroundColor(circleDefaultColor)
            }
            Spacer(minLength: 50)
          }
          VStack {
            Spacer(minLength: 50)
            Circle()
              .frame(width: circleChangeSize, height: circleChangeSize)
              .padding(10)
              .foregroundColor(circleDefaultColor)
            if (!changeShapeBoolean) {
              Circle()
                .frame(width: circleDefaultSize, height: circleDefaultSize)
                .padding(10)
                .foregroundColor(circleChangeColor)
              Circle()
                .frame(width: circleChangeSize, height: circleChangeSize)
                .padding(10)
                .foregroundColor(circleDefaultColor)
            } else {
              Rectangle()
                .frame(width: circleDefaultSize, height: circleDefaultSize)
                .padding(10)
                .foregroundColor(circleChangeColor)
              Rectangle()
                .frame(width: circleChangeSize, height: circleChangeSize)
                .padding(10)
                .foregroundColor(circleDefaultColor)
            }
            Spacer(minLength: 50)
          }
        } // HStack End
        Image(systemName: "checkmark.circle.fill")
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.yellow)
          .frame(width: 50, height: 50)
          .padding(5)
          .opacity(checkMarkOpacity)
          .transition(.scale.combined(with: .opacity))
      } // inner VStack End
      .animation(.easeInOut(duration: 1.0), value: animationBoolean)
    } // VStack End
  } // body End
  private func checkSimilarityChallengeCompleted() {
    //    let currentPage = BasicsCourse[appState.currentPage]
    //    // Mark lesson as completed
    //    appState.appendToCompletionProgress(id: currentPage.id)
    checkMarkOpacity = 1.0
  }
}
