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

block("dispose") {
    let observable = Observable.of("A", "B", "C")

    let subscription = observable.subscribe { event in
        print(event)
    }

    subscription.dispose()
}

block("disposeBag") {
    let disposeBag = DisposeBag()

    Observable.of("A", "B", "C")
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("create") {
    let disposeBag = DisposeBag()

    Observable<String>.create { observer in
        observer.onNext("A")
        observer.onNext("B")
        observer.onNext("C")
        observer.onCompleted()
        observer.onNext("D")
        return Disposables.create()
    }
    .subscribe {
        print($0)
    } onError: {
        print($0)
    } onCompleted: {
        print("Completed")
    } onDisposed: {
        print("Disposed")
    }
    .disposed(by: disposeBag)
}

block("error") {
    enum MyError: Error {
        case Error
    }

    let disposeBag = DisposeBag()

    Observable<String>.create { observer in
        observer.onNext("A")
        observer.onNext("B")
        observer.onNext("C")
        observer.onError(MyError.Error)
        observer.onNext("D")
        return Disposables.create()
    }
    .subscribe {
        print($0)
    } onError: {
        print($0)
    } onCompleted: {
        print("Completed")
    } onDisposed: {
        print("Disposed")
    }
    .disposed(by: disposeBag)
}

block("deferred") {
    let disposeBag = DisposeBag()

    let factory: Observable<Int> = Observable.deferred {
        return if Bool.random() {
            Observable.of(1, 2, 3)
        } else {
            Observable.of(4, 5, 6)
        }
    }

    for _ in 0...3 {
        factory.subscribe(onNext: {
            print($0, terminator: "")
        })
        .disposed(by: disposeBag)
        print()
    }
}
