import SwiftUI

struct PagePlaygroundView: View {
  
  /// manage user progress
  @ObservedObject private var appState: ProgressState
  
  public init(appState: ProgressState) {
    self.appState = appState
  }
  
  var body: some View {
    
    let playgroundViewtoDraw = lessons[appState.currentPage].playgroundView
    VStack{
      switch playgroundViewtoDraw {
      case .welcomePlaygroundView:
        WelcomePlaygroundView(appState: appState)
      case .continuancePlaygroundView:
        FontsPlaygroundView(progressState: appState)
      case .similarityPlaygroundView:
        SimilarityPlaygroundView(appState: appState)
      case .proximityPlaygroundView:
        ProximityPlaygroundView(appState: appState)
      case .commonFatePlaygroundView:
        CommonFatePlaygroundView(progressState: appState)
      case .closurePlaygroundView:
        ClosurePlaygroundView(progressState: appState)
      case .quizPlaygroundView:
        QuizPlaygroundView(appState: appState)
      }
    }
    .padding(30)
    .padding(.top, 15)
    .background(Color(hex: 0x363350))
    .cornerRadius(10)
  }
}
