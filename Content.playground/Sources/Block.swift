//
//  Block.swift
//
//
//  Created by Jeevan Chandra Joshi on 16/06/25.
//

import Foundation

public func block(
    _ description: String? = nil,
    _ action: () -> Void
) {
    print("\n---------- \(description ?? "xxxxx") ----------\n")
    action()
}
