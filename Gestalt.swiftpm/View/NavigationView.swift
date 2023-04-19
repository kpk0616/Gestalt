import SwiftUI

struct NavigationView: View {
  
  public init(progressState: ProgressState) { self.progressState = progressState }
  
  /// manage user progress
  @ObservedObject private var progressState: ProgressState
  
  var body : some View {
    VStack(alignment: .leading, spacing: 0){
      
      // info header start
      VStack(alignment: .leading, spacing: 4){
        Text("Gestalt Theory")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.white)
        Spacer()
          .frame(height: 20)
        HStack {
          ProgressView(value: Float(progressState.completionProgress.count), total: Float(lessons.count))
            .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
          Text("\((progressState.completionProgress.count) * 100 / lessons.count) %")
            .font(.caption)
            .foregroundColor(.white)
        }
        HStack{
          Spacer()
          Button {
            progressState.resetCompletionProgress()
          } label: {
            Text("Reset progress")
              .font(.caption)
              .foregroundColor(.yellow)
          }
          
        }
        .padding(.top, 2)
        .padding(.bottom, 60)
      }
      // info header end
      
      Text("Lessons")
        .font(.subheadline).fontWeight(.medium)
        .padding(.bottom, 10)
        .foregroundColor(.white)
      
      // page 목차 start
      VStack(alignment: .leading){
        ScrollView{
          VStack(spacing: 0){
            ForEach(lessons, id: \.self.id) { page in
              Button {
                let index = lessons.firstIndex(of: page) ?? 0
                progressState.currentPage = index
              } label: {
                
                HStack{
                  if (progressState.completionProgress.contains(page.id)) {
                    Image(systemName: "checkmark.circle.fill")
                      .resizable()
                      .scaledToFit()
                      .foregroundColor(Color.yellow)
                      .frame(width: 20, height: 20)
                      .padding(5)
                      .padding(.trailing, 4)
                      .transition(.scale.combined(with: .opacity))
                  } else {
                    Image(systemName: page.titleIconName)
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
                .background(page.id == lessons[progressState.currentPage].id ? Color(hex: 0x696682) : Color.clear )
                .cornerRadius(10)
              }
            }
          }
        }
      }
      // page 목차 end
    }
    .padding(18)
    .padding(.top, 25)
    .background(Color(hex: 0x363350))
    .animation(Animation.timingCurve(0.44, 1.86, 0.61, 0.99, duration: 0.5), value: progressState.completionProgress)
    .frame(width: 260)
  }
}
