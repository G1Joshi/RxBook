//
//  Block.swift
//
//
//  Created by Jeevan Chandra Joshi on 16/06/25.
//

import Foundation
import RxSwift

public func block(
    _ description: String? = nil,
    _ action: () -> Void
) {
    print("\n|---------- \(description ?? "xxxxx") ----------|")
    action()
}

public let disposeBag = DisposeBag()

public enum MyError: Error {
    case Error
}

public func log<T: CustomStringConvertible>(_ label: String, event: Event<T>) {
    print(label, (event.element ?? event.error) ?? event)
}
