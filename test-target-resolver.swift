#!/usr/bin/swift

// @param filePaths a list of file paths concatenated into a string
// @return a list of targets required for xcodebuild's -only-testing parameter
// @see https://developer.apple.com/library/content/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-PRODUCT
func resolve(filePaths: String) -> String {
    let paths = filePaths.split(separator: ",")
    print("\(paths)")
    return "CommandsTests"
}

if let filePaths  = CommandLine.arguments[1] {
    print(resolve(filePaths: filePaths))
    exit(0)
} else {
    print("Nothing changed")
    exit(1)
}
