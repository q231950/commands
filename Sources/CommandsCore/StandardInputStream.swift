//
//  StandardInputStream.swift
//  CommandsPackageDescription
//
//  Created by Martin Kim Dung-Pham on 20.10.17.
//

import Foundation

public class StandardInputStream: InputStream {

    private var data: Data?
    public override var hasBytesAvailable: Bool {
        return true
    }

    public override func read(_ buffer: UnsafeMutablePointer<UInt8>, maxLength len: Int) -> Int {

        return 0
    }

    public override func getBuffer(_ buffer: UnsafeMutablePointer<UnsafeMutablePointer<UInt8>?>, length len: UnsafeMutablePointer<Int>) -> Bool {

        if let buffer = buffer.pointee as UnsafeMutablePointer<UInt8>? {
            if let data = data {
                data.copyBytes(to: buffer, count: len.pointee)
            }
        }
        return true
    }

    public func write(text: String) {
        data = "hi".data(using: .utf8)
    }

    
}
