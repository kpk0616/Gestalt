import SwiftUI

struct BasicView: View {
  
  @StateObject var progressState = ProgressState()
  
  var body: some View {
    HStack(spacing: 0){
      NavigationView(progressState: progressState)
      ContentView(progressState: progressState)
    }
    .ignoresSafeArea()
  }
}
