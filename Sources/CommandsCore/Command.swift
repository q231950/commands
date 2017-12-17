public struct Command {
    let launchPath: String
    let arguments: [String]

    init(launchPath: String, arguments: [String] = []) {
        self.launchPath = launchPath
        self.arguments = arguments
    }
}