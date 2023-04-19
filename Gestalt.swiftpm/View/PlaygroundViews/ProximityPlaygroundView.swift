import SwiftUI

struct ProximityPlaygroundView: View {
  
  // manage user progress
  @ObservedObject var appState: AppState
  
  @State private var kerning = -6.0
  @State private var proximityDistance = 10.0
  
  @State private var cornerRadius = 10.0
  @State private var padding = 5.0
  @State private var rectangleWidth = 70.0
  @State private var rectangleHeight = 50.0
  
  var body: some View { // body Start
    VStack{ // Outer VStack Start
      Spacer()
      HStack {
        ForEach(0..<2) {_ in
          VStack {
            ForEach(0..<4) {_ in
              Capsule()
                .frame(width: rectangleWidth, height: rectangleHeight)
                .padding(padding)
                .foregroundColor(.pink)
            }
          }
        }
        Spacer()
          .frame(width: proximityDistance)
        VStack {
          ForEach(0..<4) {_ in
            Capsule()
              .frame(width: rectangleWidth, height: rectangleHeight)
              .padding(padding)
              .foregroundColor(.pink)
          }
        }
      }
      Spacer()
        .frame(height: 50)
      // distance
      HStack{
        if proximityDistance > 40 {
          Image(systemName: "checkmark.circle.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.yellow)
            .frame(width: 20, height: 20)
            .padding(5)
            .transition(.scale.combined(with: .opacity))
          
        } else {
          Image(systemName: "space")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.yellow)
            .frame(width: 20, height: 20)
            .padding(5)
            .transition(.scale.combined(with: .opacity))
        }
        
        Text("Distance") // TODO: - 단어 수정?
          .font(.callout)
          .padding(5)
          .animation(.none, value: kerning)
          .foregroundColor(.white)
        Slider(value: $proximityDistance.animation(Animation.timingCurve(0.44, 1.86, 0.61, 0.99, duration: 0.5)), in: 10...200)
          .animation(.none, value: kerning)
        Text("\(proximityDistance, specifier: "%.00f")")
          .monospacedDigit()
          .font(.caption)
          .padding(5)
          .animation(.none, value: kerning)
        
        
      } // HStack End
      .padding()
      .background(
        Color(hex: 0x696682)
      )
      .cornerRadius(10)
      .padding(.bottom, 5)
    } // Outer VStack End
    .onChange(of: kerning) { newValue in
      checkChallengeCompleted()
    }
    .onChange(of: proximityDistance) { newValue in
      checkChallengeCompleted()
    }
  } // body End
  
  func checkChallengeCompleted(){
    if (proximityDistance > 40) {
      /// currently opend page
      let currentPage = BasicsCourse[appState.currentPage]
      // Mark lesson as completed
      appState.appendToCompletionProgress(id: currentPage.id)
    }
  }
}

