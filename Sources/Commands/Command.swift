public struct Command {
    let launchPath: String
    let arguments: [String]

    public init(launchPath: String, arguments: [String] = []) {
        self.launchPath = launchPath
        self.arguments = arguments
    }
}
