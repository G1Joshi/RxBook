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

block("combineLatest") {
    let first = PublishSubject<String>()
    let second = PublishSubject<String>()

    Observable.combineLatest(first, second) {
        "\($0) \($1)"
    }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

    first.onNext("AA")
    second.onNext("BA")
    second.onNext("BB")
    first.onNext("AB")

    first.onCompleted()
    second.onCompleted()
}

block("zip") {
    let first = Observable.of(1, 2, 3, 4, 5)
    let second = Observable.of("A", "B", "C", "D", "E")

    Observable.zip(first, second) {
        "\($0) : \($1)"
    }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)
}

block("withLatestFrom") {
    let button = PublishSubject<Void>()
    let textField = PublishSubject<String>()

    button.withLatestFrom(textField)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    textField.onNext("A")
    textField.onNext("AB")
    textField.onNext("ABC")

    button.onNext(())
    button.onNext(())
    button.onNext(())
}

block("amb") {
    let first = PublishSubject<String>()
    let second = PublishSubject<String>()

    first.amb(second)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    first.onNext("A")
    second.onNext("B")
    first.onNext("C")
    second.onNext("D")

    first.onCompleted()
    second.onCompleted()
}

block("switchLatest") {
    let one = PublishSubject<String>()
    let two = PublishSubject<String>()
    let three = PublishSubject<String>()

    let source = PublishSubject<Observable<String>>()

    source.switchLatest()
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    source.onNext(one)
    one.onNext("A")
    two.onNext("B")
    source.onNext(two)
    two.onNext("C")
    one.onNext("D")
    source.onNext(three)
    three.onNext("E")
    two.onNext("F")
    one.onNext("G")
    source.onNext(one)
    one.onNext("H")
    two.onNext("I")
}

block("reduce") {
    Observable.of(1, 3, 5, 7, 9)
        .reduce(0) {
            $0 + $1
        }
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("scan") {
    Observable.of(1, 3, 5, 7, 9)
        .scan(0) {
            $0 + $1
        }
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}
