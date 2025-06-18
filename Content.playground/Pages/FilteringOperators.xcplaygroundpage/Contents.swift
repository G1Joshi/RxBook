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
