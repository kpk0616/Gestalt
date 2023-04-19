import SwiftUI

struct BaseView: View {
  
  /// manage user progress
  @StateObject var appState = ProgressState()
  
  var body: some View {
    HStack(spacing: 0){
      // Navigation
      PageNavigationView(appState: appState)
        .frame(width: 260)
      
      // Content
      PageContentView(appState: appState)
    }
    .ignoresSafeArea()
  }
}
