//
//  CommandExecutor.swift
//  Commands
//
//  Created by Martin Kim Dung-Pham on 14.10.17.
//

import Foundation

class CommandExecutor {
    func executeCommand(at launchPath: String, arguments: [String]) {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments
        let pipe = Pipe()
        process.standardOutput = pipe
        pipe.fileHandleForReading.readabilityHandler = { handle in
            let data = handle.availableData
            if let output = String(data:data, encoding: String.Encoding.utf8) {
                print(output)
            }
        }
        process.launch()
        process.waitUntilExit()
    }
}
