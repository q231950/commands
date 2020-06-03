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

        let launchPath = arguments[1]
        let command = Command(launchPath: launchPath, arguments: forwardArguments())
        let commandExecutor = CommandExecutor()
        commandExecutor.terminationHandler = { _ in
            return
        }
        commandExecutor.outputHandler = { text in
            print(text)
        }

        DispatchQueue.global(qos: .userInitiated).async {
            while let input = readLine() {
                commandExecutor.write(input: input)
            }
        }

        commandExecutor.execute(command)
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
