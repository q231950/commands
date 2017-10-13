import Foundation

public final class Commands {
  private let arguments: [String]

  public init(arguments: [String] = CommandLine.arguments) {
    self.arguments = arguments 
  }

  public func run() throws {
    print("hello world")
  }
}
