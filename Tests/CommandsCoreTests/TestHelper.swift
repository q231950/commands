//
//  TestHelper.swift
//  CommandsCoreTests
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import Foundation

extension String {
    func makeScript(for anyClass: AnyObject.Type) -> String? {
        let bundle = Bundle(for: anyClass)
        if let url = URL(string: bundle.resourcePath! + "/script.sh") {
            let path = url.absoluteString
            FileManager().createFile(atPath: path, contents: data(using: String.Encoding.utf8), attributes: nil)
            return path
        }

        return nil
    }
}
