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
        let commandExecutor = CommandExecutor(launchPath: launchPath, arguments: (forwardArguments()))

        commandExecutor.outputPipe.fileHandleForReading.readabilityHandler = { handle in
            let data = handle.availableData
            print("\(String(data: data, encoding: .utf8)!)")
        }

        DispatchQueue.global(qos: .background).async {
            commandExecutor.execute()
        }


        while let x = readLine() {
            commandExecutor.write(input: x)
        }
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
