import SwiftUI

struct PagePlaygroundView: View {
    
    /// manage user progress
    @ObservedObject private var appState: AppState
    
    public init(appState: AppState) {
        self.appState = appState
    }
    
    var body: some View {
        
        let playgroundViewtoDraw = BasicsCourse[appState.currentPage].playgroundView
        VStack{
            switch playgroundViewtoDraw {
            case .welcomePlaygroundView:
                WelcomePlaygroundView(appState: appState)
            case .sightPlacePlaygroundView:
                FontsPlaygroundView(appState: appState)
            case .similarityPlaygroundView:
                HierarchyPlaygroundView(appState: appState)
            case .appPlaygroundView:
                AppPlaygroundView(appState: appState)
            case .kerningPlaygroundView:
                KerningPlaygroundView(appState: appState)
            case .quizPlaygroundView:
                QuizPlaygroundView(appState: appState)
            }
        }
        .padding(30)
        .padding(.top, 15)
        .border(Color(uiColor: .secondarySystemBackground), width: 2.5)
        .cornerRadius(10)
//      Color(uiColor: .secondarySystemBackground)
    }
}