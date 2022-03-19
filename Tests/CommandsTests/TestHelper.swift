//
//  TestHelper.swift
//  CommandsTests
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import Foundation

extension String {
    func makeScript(named name:String) -> String? {
        let temporaryDirectoryPath = NSTemporaryDirectory()
        guard let url = URL(string: "\(temporaryDirectoryPath)/\(name).sh") else { return nil }

        let path = url.absoluteString
        FileManager().createFile(atPath: path, contents: data(using: .utf8), attributes: nil)
        return path
    }
}
