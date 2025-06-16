import Foundation
import PlaygroundSupport
import RxCocoa
import RxSwift
import UIKit

block("observable") {
    let one = 1
    let two = 2
    let three = 3

    let observable1: Observable<Int> = Observable.just(one)
    let observable2: Observable<[Int]> = Observable.just([one])
    let observable3: Observable<Int> = Observable.of(one, two, three)
    let observable4: Observable<[Int]> = Observable.of([one, two, three])
    let observable5: Observable<Int> = Observable.from([one, two, three])
}

block("subscribe") {
    let one = 1
    let two = 2
    let three = 3

    let observable = Observable.of(one, two, three)

    observable.subscribe { event in
        print(event)
    }

    observable.subscribe { event in
        if let elememt = event.element {
            print(elememt)
        }
    }

    observable.subscribe(
        onNext: { element in
            print(element)
        },
        onCompleted: {
            print("Completed")
        }
    )
}

block("empty") {
    let observable: Observable<Void> = Observable.empty()

    observable.subscribe(
        onNext: { element in
            print(element)
        },
        onCompleted: {
            print("Completed")
        }
    )
}

block("never") {
    let observable: Observable<Any> = Observable.never()

    observable.subscribe(
        onNext: { element in
            print(element)
        },
        onCompleted: {
            print("Completed")
        }
    )
}

block("range") {
    let observable: Observable<Int> = Observable.range(start: 1, count: 10)

    observable.subscribe(onNext: { element in
        let number = Double(element)
        let fibonacci = Int(
            ((pow(1.61803, number) - pow(0.61803, number)) / 2.23606).rounded()
        )
        print(fibonacci)
    })
}
