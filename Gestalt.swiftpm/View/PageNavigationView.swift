import SwiftUI

struct PageNavigationView: View {
  
  public init(appState: AppState) { self.appState = appState }
  
  /// manage user progress
  @ObservedObject private var appState: AppState
  
  /// defines if the app shows the about window
  @State private var showingAboutView = false
  
  var body : some View {
    VStack(alignment: .leading, spacing: 0){
      
      courseInfoHeader
      
      Text("Lessons")
        .font(.subheadline).fontWeight(.medium)
        .padding(.bottom, 10)
        .foregroundColor(.white)
      
      pageOverview
      
//      moreButton
    }
    .padding(18)
    .padding(.top, 25)
//    .background(Color(uiColor: .secondarySystemBackground))
    .background(Color(hex: 0x363350))
    .animation(Animation.timingCurve(0.44, 1.86, 0.61, 0.99, duration: 0.5), value: appState.completionProgress)
    .sheet(isPresented: $showingAboutView){
      AboutView()
    }
  }
  
  
  //  MARK: courseInfoHeader
  /// contines course title and a progress bar
  var courseInfoHeader : some View {
    VStack(alignment: .leading, spacing: 4){
      Text("Gestalt Theory")
        .font(.title3).fontWeight(.bold)
        .padding(.bottom, 20)
        .foregroundColor(.white)
      HStack {
        ProgressView(value: Float(appState.completionProgress.count), total: Float(BasicsCourse.count))
          .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
        Text("\((appState.completionProgress.count) * 100 / BasicsCourse.count) %")
          .font(.caption)
          .foregroundColor(.white)
      }
      HStack{
        Spacer()
        Button {
          appState.resetCompletionProgress()
        } label: {
          Text("Reset progress")
            .font(.caption)
            .foregroundColor(.yellow)
        }
        
      }
      .padding(.top, 2)
      .padding(.bottom, 60)
    }
  }
  
  //  MARK: pageOverview
  /// shows all availabe pages in a course including its completion status and allows navigation
  var pageOverview: some View {
    VStack(alignment: .leading){
      ScrollView{
        VStack(spacing: 0){
          ForEach(BasicsCourse, id: \.self.id) { page in
            Button {
              let index = BasicsCourse.firstIndex(of: page) ?? 0
              appState.currentPage = index
            } label: {
              
              HStack{
                if (appState.completionProgress.contains(page.id)) {
                  Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.yellow)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                } else {
                  Image(systemName: page.titleImageName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color.white)
                    .frame(width: 20, height: 20)
                    .padding(5)
                    .padding(.trailing, 4)
                    .transition(.scale.combined(with: .opacity))
                }
                Text(page.title)
                  .font(.callout)
                  .foregroundColor(.white)
                Spacer()
              }
              .padding(10)
              .background(page.id == BasicsCourse[appState.currentPage].id ? Color(hex: 0x696682) : Color.clear )
              .cornerRadius(10)
            }
          }
        }
      }
    }
  }
  
  //  MARK: moreButton
  /// toggles a modal view showing background info about the app
  var moreButton: some View {
    Button {
      showingAboutView.toggle()
    } label: {
      HStack{
        Image(systemName: "info.circle")
          .resizable()
          .scaledToFit()
          .foregroundColor(Color.accentColor)
          .frame(width: 17, height: 17)
          .padding(5)
        //.padding(.trailing, 2)
          .transition(.scale.combined(with: .opacity))
        
        Text("About this app")
          .font(.footnote)
          .foregroundColor(.primary)
        Spacer()
      }
    }
  }
  
}
