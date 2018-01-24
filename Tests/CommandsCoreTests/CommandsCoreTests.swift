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
}
