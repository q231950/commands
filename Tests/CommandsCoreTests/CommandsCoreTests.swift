import XCTest
@testable import CommandsCore

class CommandsCoreTests: XCTestCase {

    func testMissingLaunchPath() {
        let arguments = ["a"]
        let commands = Commands(arguments: arguments)
        XCTAssertThrowsError(try commands.run())
    }

    func testMissingLaunchPathError() {
        let arguments = ["a"]
        let commands = Commands(arguments: arguments)
        do {
            try commands.run()
        }
        catch let e as Commands.Error {
            XCTAssertEqual(e, .missingLaunchPath)
        }
        catch {
            XCTFail("The error for a missing launch path is incorrect")
        }
    }

    func testForwardArguments() {
        let arguments = ["a", "b", "c"]
        let commands = Commands(arguments: arguments)
        XCTAssertEqual(commands.forwardArguments(), ["c"])
    }

    func testExecutesScript() {
        if let path = createScript(
            """
            #!/bin/sh
            echo "hello world"
            echo "hello second world"
            exit
            """) {
            let arguments = ["Commands", "/bin/sh", path]
            let commands = Commands(arguments: arguments)
            XCTAssertNoThrow(try commands.run())
        } else {
            XCTFail()
        }
    }

    private func createScript(_ script: String) -> String? {
        let bundle = Bundle(for: type(of: self))
        if let url = URL(string: bundle.resourcePath! + "/script.sh") {
            let path = url.absoluteString
            FileManager().createFile(atPath: path, contents: script.data(using: String.Encoding.utf8), attributes: nil)
            return path
        }

        return nil
    }
}
