import SwiftUI

struct BaseView: View {
  
  /// manage user progress
  @StateObject var progressState = ProgressState()
  
  var body: some View {
    HStack(spacing: 0){
      // Navigation
      PageNavigationView(progressState: progressState)
        .frame(width: 260)
      
      // Content
      PageContentView(progressState: progressState)
    }
    .ignoresSafeArea()
  }
}
