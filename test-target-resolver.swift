#!/usr/bin/swift

import Foundation

// @param filePaths a list of file paths concatenated into a string
// @return a list of targets required for xcodebuild's -only-testing parameter
// @see https://developer.apple.com/library/content/technotes/tn2339/_index.html#//apple_ref/doc/uid/DTS40014588-CH1-PRODUCT
func resolve(filePaths: String) -> String {
    //let paths = filePaths.split(separator: "\n")
    return "-only-testing:CommandsTests"
    // return "-only-testing:CommandsTests -only-testing:CommandsCoreTests"
}

let args = CommandLine.arguments

if args.count > 1 {
    print(resolve(filePaths: args[1]))
    exit(0)
} else {
    print("Nothing changed")
    exit(123)
}