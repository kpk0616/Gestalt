import SwiftUI

struct ContentView : View {
  
  @ObservedObject private var progressState: ProgressState
  
  var currentPage : Page {
    lessons[progressState.currentPage]
  }
  
  public init(progressState: ProgressState) {
    self.progressState = progressState
  }
  
  var body: some View {
    ZStack {
      Color(hex: 0x1C1934)
      VStack(alignment: .leading, spacing: 0){
        pageContent
      }
      .padding(30)
      .padding(.top, 15)
    }
  }
  
  let spacingValue : CGFloat = 16
  let topBottomSpacingValue : CGFloat = 22
  
  //  MARK: pageContent
  var pageContent : some View {
    ScrollView(showsIndicators: false){
      pageHeader
      
      ScrollViewReader { value in
        VStack(alignment: .leading, spacing: spacingValue){
          ForEach(currentPage.elements, id: \.self.id) { element in
            
            // Page dawing "engine"
            
            // Draw PageSubTitle elements
            if let pageHeadline = element as? PageHeadline {
              Text(pageHeadline.text)
                .font(.system(size: 22))
                .fontWeight(.semibold)
                .lineSpacing(3.5)
                .padding(.top, pageHeadline.spacing ? topBottomSpacingValue : 0)
                .foregroundColor(.white)
            }
            
            // Draw PageText elements
            if let pageText = element as? PageText {
              Text(pageText.text)
                .lineSpacing(3.5)
                .font(.system(size: 18))
                .padding(.top, pageText.spacing ? topBottomSpacingValue : 0)
                .foregroundColor(.white)
            }
            
            // Draw PageImage elements
            if let pageImage = element as? PageIcon {
              Image(pageImage.imageName)
                .resizable()
                .scaledToFit()
                .padding(.top, pageImage.spacing ? topBottomSpacingValue : 0)
            }
            
            // Draw PageTask elements
            if let pageTask = element as? PageTask {
              HStack{
                Rectangle()
                  .foregroundColor(.yellow)
                  .frame(width: 5)
                  .cornerRadius(10)
                  .padding(1)
                VStack(alignment: .leading){
                  Text("Challenge 💡")
                    .lineSpacing(3.5)
                    .font(.system(size: 15))
                    .foregroundColor(.yellow)
                    .fontWeight(.semibold)
                  Text(pageTask.text)
                    .font(.system(size: 18))
                    .padding(.top, 2)
                    .lineSpacing(3)
                    .foregroundColor(.white)
                  
                  if let subTasks = pageTask.subTasks {
                    Rectangle()
                      .frame(height: 2)
                      .foregroundColor(Color.clear)
                  }
                }
                .padding(5)
                Spacer()
              }
              .padding(10)
              .background(Color(hex: 0x696682))
              .cornerRadius(10)
              .padding(.top, pageTask.spacing ? topBottomSpacingValue : 0)
              PlaygroundView(progressState: progressState)
            }
          }
          .onChange(of: progressState.currentPage, perform: { x in
            value.scrollTo(currentPage.elements.first!.id, anchor: .center)
          })
        }
        //compensate missing VStack spacing top and bottom
        .padding(.top, spacingValue)
        .padding(.bottom, spacingValue)
        
        // show footer navigation only if not on last page
        if progressState.currentPage + 1 < lessons.count {
          navigationButtons
            .padding(.bottom, spacingValue)
        }
      }
      
    }
    .transition(.slide)
  }
  
  // MARK: navigationButtons
  var  navigationButtons : some View {
    VStack{
      if progressState.currentPage + 1 < lessons.count {
        Button {
          progressState.currentPage += 1
        } label: {
          Spacer()
          Text("Next lesson")
            .fontWeight(.medium)
            .foregroundColor(.yellow)
            .padding(5)
          Spacer()
        }
        .padding(10)
        .background(Color(hex: 0x696682))
        .cornerRadius(10)
        .padding(.bottom, progressState.currentPage - 1 < 0 ? 10 : 0 )
        .keyboardShortcut(.downArrow, modifiers: [])
      }
      
      // show back button
      if progressState.currentPage - 1 >= 0 {
        Button {
          progressState.currentPage -= 1
        } label: {
          Spacer()
          Text("Previous")
            .font(.callout)
            .foregroundColor(.white)
            .fontWeight(.medium)
          Spacer()
        }
        .padding(13)
        .background(Color(hex: 0x363350))
        .cornerRadius(10)
        .keyboardShortcut(.upArrow, modifiers: [])
      }
    }
    .padding(.top, 15)
  }
  
  //  MARK: pageHeader
  /// shows icon, page number and title of the page
  var pageHeader: some View {
    VStack(spacing: 0){
      HStack{
        Spacer()
        Image(systemName: currentPage.titleIconName)
          .resizable()
          .scaledToFit()
          .foregroundColor(Color(uiColor: .white))
          .frame(width: 30, height: 30)
          .padding()
          .background(
            LinearGradient(colors: [Color(hex: 0xE6504D), Color(hex: 0x4077F4)], startPoint: .topLeading, endPoint: .bottomTrailing)
              .cornerRadius(15)
          )
        Spacer()
      }
      
      VStack(spacing: 6){
        Text(currentPage.contentSubTitle)
          .font(.system(size: 14))
          .foregroundColor(.white)
          .padding(.top, 7)
        Text(currentPage.contentTitle)
          .font(.title).fontWeight(.bold)
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
      }
      .padding(.top)
    }
  }
}
