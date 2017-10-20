//
//  TestHelper.swift
//  CommandsCoreTests
//
//  Created by Martin Kim Dung-Pham on 17.10.17.
//

import Foundation

extension String {
    func makeScript(for type: AnyObject.Type) -> String? {
        let bundle = Bundle(for: type)
        guard let resourcePath = bundle.resourcePath, let url = URL(string: "\(resourcePath)/script.sh") else { return nil }

        let path = url.absoluteString
        FileManager().createFile(atPath: path, contents: data(using: .utf8), attributes: nil)
        return path
    }
}
