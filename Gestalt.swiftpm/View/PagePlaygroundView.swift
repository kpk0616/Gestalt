import SwiftUI

struct PagePlaygroundView: View {
  
  /// manage user progress
  @ObservedObject private var progressState: ProgressState
  
  public init(progressState: ProgressState) {
    self.progressState = progressState
  }
  
  var body: some View {
    
    let playgroundViewtoDraw = lessons[progressState.currentPage].playgroundView
    VStack{
      switch playgroundViewtoDraw {
      case .welcomePlaygroundView:
        WelcomePlaygroundView(progressState: progressState)
      case .similarityPlaygroundView:
        SimilarityPlaygroundView(progressState: progressState)
      case .proximityPlaygroundView:
        ProximityPlaygroundView(progressState: progressState)
      case .commonFatePlaygroundView:
        CommonFatePlaygroundView(progressState: progressState)
      case .closurePlaygroundView:
        ClosurePlaygroundView(progressState: progressState)
      case .quizPlaygroundView:
        QuizPlaygroundView(progressState: progressState)
      }
    }
    .padding(30)
    .padding(.top, 15)
    .background(Color(hex: 0x363350))
    .cornerRadius(10)
  }
}
