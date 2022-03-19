# Commands

> **Commands** allows you to execute commands from within your application and capture their output and exit codes. 

## Install

As a Swift Package:

```swift
```

## Usage

You can build and run an example from the command line or by running the _CommandsExample_ target in Xcode. The example utilizes **Commands** to print some date and time.

```bash
kim@mbp commands % swift run
Building for debugging...
Build complete! (0.15s)
output:
DATE: 2022-03-19
TIME: 19:44:28

exit code: 0
```

The _DATE/TIME_ text is output of the command that you can find in [main.swift](https://github.com/q231950/commands/blob/main/Sources/CommandsExample/main.swift#L8-L29) of the _CommandsExample_ target. It is described in more detail there, but here is the shortened essence of that code. This is also how you can execute commands and capture their output and exit codes from within your code:

```swift
let command = Command(launchPath: "/bin/date", arguments: ["+%nDATE: %Y-%m-%d%nTIME: %H:%M:%S"])

let commandExecutor = CommandExecutor()

commandExecutor.outputHandler = { text in
    print("output: \(text)")
}

commandExecutor.terminationHandler = { code in
    print("exit code: \(code)")
}

commandExecutor.execute(command)
```

## Test

`swift test`

---

Have fun 🐼
