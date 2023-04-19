import SwiftUI

public struct Page: Equatable {
  
  var id: String
  
  let title: String
  
  let contentSubTitle: String
  
  let contentTitle: String
  
  let titleIconName: String
  
  let playgroundView: PlaygroundViews
  
  let elements: [PageElement]
  
  public static func == (lhs: Page, rhs: Page) -> Bool {
    return lhs.id == rhs.id
  }
}

class PageElement {
  
  var id: UUID
  var topSpacing: Bool
  var bottomSpacing: Bool
  
  init(_ topSpacing: Bool, _ bottomSpacing: Bool) {
    id = UUID()
    self.topSpacing = topSpacing
    self.bottomSpacing = bottomSpacing
  }
  
}


// MARK: PageElements:
class PageText : PageElement {
  var text: String
  
  init(_ text: String, topSpacing: Bool = false, bottomSpacing: Bool = false) {
    self.text = text
    super.init(topSpacing, bottomSpacing)
  }
}

class PageHeadline : PageElement {
  var text: String
  
  init(_ text: String, topSpacing: Bool = false, bottomSpacing: Bool = false) {
    self.text = text
    super.init(topSpacing, bottomSpacing)
  }
}

class PageIcon : PageElement {
  var imageName: String

  init(imageName: String, topSpacing: Bool = false, bottomSpacing: Bool = false) {
    self.imageName = imageName
    super.init(topSpacing, bottomSpacing)
  }
}

class PageTask : PageElement {
  var text: String
  var subTasks: [String]?

  init(_ text: String, subTasks: [String]? = nil, topSpacing: Bool = false, bottomSpacing: Bool = false) {
    self.text = text
    self.subTasks = subTasks
    super.init(topSpacing, bottomSpacing)
  }
}
