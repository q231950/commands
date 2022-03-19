/**
 *  This is an example usage of the Commands package.
 */

import Foundation
import Commands

// ``Command`` holds the input one would normally enter in the terminal to execute some commands.
// Here, we create a command to print the current date and time
let command = Command(launchPath: "/bin/date", arguments: ["+%nDATE: %Y-%m-%d%nTIME: %H:%M:%S"])

// In order to execute a command, an executor is needed.
// So, to get the output of any command and its exit code one needs to create a ``CommandExecutor``.
let commandExecutor = CommandExecutor()

// The command executor returns any output by the process initiated by it.
// In this example, it's the process that runs the `date` executable at the launch path `/bin/date`.
commandExecutor.outputHandler = { text in
    print("output: \(text)")
}

// Once a process has finished, it results in an exit code.
commandExecutor.terminationHandler = { code in
    print("exit code: \(code)")
}

// Finally, the command needs to be executed.
// Be aware that executing the same command multiple times results in multiple processes.
commandExecutor.execute(command)
