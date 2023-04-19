import SwiftUI

/// Manages and saves user progress persistantly
public class ProgressState: ObservableObject {
  
  private let userDefaults = UserDefaults.standard
  
  public init() {
    // init currentPage with data from user defaults
    currentPage = userDefaults.integer(forKey: "currentPage")
    
    // init completionProgress with data from user defaults
    if let savedCompletionProgress = userDefaults.data(forKey: "completionProgress") {
      if let decodedCompletionProgress = try? JSONDecoder().decode([String].self, from: savedCompletionProgress) {
        completionProgress = decodedCompletionProgress
        return
      }
    }
    // Default to an empty array
    completionProgress = [String]()
  }
  
  /// Stores the currently opened page in user defaults and makes it available
  /// Used for restoring the last opened page when the user restarts the app
  @Published public var currentPage: Int {
    didSet{
      userDefaults.set(currentPage, forKey: "currentPage")
    }
  }
  
  /// Stores the page completion progress in user defaults and makes it available
  @Published public var completionProgress: [String] {
    didSet{
      if let encoded = try? JSONEncoder().encode(completionProgress) {
        userDefaults.set(encoded, forKey: "completionProgress")
      }
    }
  }
  
  /// Reset all user progress
  func resetCompletionProgress() {
    completionProgress = [String]()
    currentPage = 0
  }
  
  /// Save new view playgroundPage id as completed, will do noting, if the id already exists
  func appendToCompletionProgress(id: String) {
    if !completionProgress.contains(id) {
      completionProgress.append(id)
    }
  }
  
}
