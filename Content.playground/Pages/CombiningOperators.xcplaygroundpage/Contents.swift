import Foundation
import PlaygroundSupport
import RxCocoa
import RxSwift
import UIKit

block("startWith") {
    Observable.of(1, 2, 3).startWith(0)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("concat") {
    let first = Observable.of(1, 2, 3)
    let second = Observable.of(4, 5, 6)

    Observable.concat(first, second)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    first.concat(second).subscribe {
        print($0)
    }
    .disposed(by: disposeBag)
}

block("concatMap") {
    let sequences = [
        "A": Observable.of(1, 2, 3),
        "B": Observable.of(4, 5, 6),
    ]

    Observable.of("A", "B")
        .concatMap { country in sequences[country] ?? .empty() }
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("merge") {
    let first = PublishSubject<String>()
    let second = PublishSubject<String>()

    Observable.of(first, second)
        .merge()
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    var firstValues = ["A", "B", "C"]
    var secondValues = ["D", "E", "F"]

    repeat {
        switch Bool.random() {
        case true where !firstValues.isEmpty:
            first.onNext("1: " + firstValues.removeFirst())
        case false where !secondValues.isEmpty:
            second.onNext("2: " + secondValues.removeFirst())
        default:
            break
        }
    } while !firstValues.isEmpty || !secondValues.isEmpty

    first.onCompleted()
    second.onCompleted()
}
