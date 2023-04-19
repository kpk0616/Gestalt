import SwiftUI

public class ProgressState: ObservableObject {
  
  private let userDefaults = UserDefaults.standard
  
  public init() {
    currentPage = userDefaults.integer(forKey: "currentPage")
    
    if let savedCompletionProgress = userDefaults.data(forKey: "completionProgress") {
      if let decodedCompletionProgress = try? JSONDecoder().decode([String].self, from: savedCompletionProgress) {
        completionProgress = decodedCompletionProgress
        return
      }
    }
    completionProgress = [String]()
  }
  
  @Published public var currentPage: Int {
    didSet{
      userDefaults.set(currentPage, forKey: "currentPage")
    }
  }
  
  @Published var completionProgress: [String] = [] {
      didSet {
          let data = try? JSONEncoder().encode(completionProgress)
          userDefaults.set(data, forKey: "completionProgress")
      }
  }
  
  func resetProgress() {
    completionProgress = [String]()
    currentPage = 0
  }
  
  func appendToCompletionProgress(id: String) {
    if (!completionProgress.contains(id)) {
      completionProgress.append(id)
    }
  }
  
}
