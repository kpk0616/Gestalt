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
  var spacing: Bool
  
  init(_ spacing: Bool) {
    id = UUID()
    self.spacing = spacing
  }
  
}


// MARK: PageElements:
class PageText : PageElement {
  var text: String
  
  init(_ text: String, spacing: Bool = false) {
    self.text = text
    super.init(spacing)
  }
}

class PageHeadline : PageElement {
  var text: String
  
  init(_ text: String, spacing: Bool = false) {
    self.text = text
    super.init(spacing)
  }
}

class PageIcon : PageElement {
  var imageName: String

  init(imageName: String, spacing: Bool = false) {
    self.imageName = imageName
    super.init(spacing)
  }
}

class PageTask : PageElement {
  var text: String
  var subTasks: [String]?

  init(_ text: String, subTasks: [String]? = nil, spacing: Bool = false) {
    self.text = text
    self.subTasks = subTasks
    super.init(spacing)
  }
}
