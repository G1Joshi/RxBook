import Foundation
import PlaygroundSupport
import RxCocoa
import RxSwift
import UIKit

block("ignoreElements") {
    let strikes: PublishSubject<String> = PublishSubject()
    let disposeBag = DisposeBag()

    strikes
        .ignoreElements()
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    strikes.onCompleted()
}

block("elementAt") {
    let strikes: PublishSubject<String> = PublishSubject()
    let disposeBag = DisposeBag()

    strikes
        .element(at: 2)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    strikes.onNext("A")
    strikes.onNext("B")
    strikes.onNext("C")
    strikes.onCompleted()
}

block("filter") {
    let disposeBag = DisposeBag()

    Observable.of(1, 2, 3, 4, 5, 6)
        .filter { $0 % 2 == 0 }
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("skip") {
    let disposeBag = DisposeBag()

    Observable.of(1, 2, 3, 4, 5, 6)
        .skip(3)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("skipWhile") {
    let disposeBag = DisposeBag()

    Observable.of(0, 2, 4, 5, 6, 7)
        .skip(while: { $0 % 2 == 0 })
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("skipUntil") {
    let disposeBag = DisposeBag()

    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()

    subject
        .skip(until: trigger)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    subject.onNext("A")
    trigger.onNext("B")
    subject.onNext("C")
}

block("take") {
    let disposeBag = DisposeBag()

    Observable.of(1, 2, 3, 4, 5, 6)
        .take(3)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("takeWhile") {
    let disposeBag = DisposeBag()

    Observable.of(0, 2, 4, 5, 6, 7)
        .take(while: { $0 % 2 == 0 })
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("takeUntil") {
    let disposeBag = DisposeBag()

    let subject = PublishSubject<String>()
    let trigger = PublishSubject<String>()

    subject
        .take(until: trigger)
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)

    subject.onNext("A")
    trigger.onNext("B")
    subject.onNext("C")
}

block("distinctUntilChanged") {
    let disposeBag = DisposeBag()

    Observable.of(1, 2, 2, 3, 3, 3, 2, 2, 1)
        .distinctUntilChanged()
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}
