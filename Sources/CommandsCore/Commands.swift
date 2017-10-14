import Foundation

public final class Commands {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }

    public func run() throws {
        guard arguments.count > 1 else {
            throw Error.missingLaunchPath
        }

        let commandExecutor = CommandExecutor()
        let launchPath = arguments[1]

        commandExecutor.executeCommand(at: launchPath, arguments: forwardArguments())
    }

    internal func forwardArguments() -> [String] {
        var args = arguments
        args.removeFirst()
        args.removeFirst()
        return args
    }
}

public extension Commands {
    enum Error: Swift.Error {
        case missingLaunchPath
    }
}

extension Commands.Error: CustomStringConvertible {
    public var description: String {
        switch self {
        case .missingLaunchPath:
            return "The launch path is missing"
        }
    }
}
