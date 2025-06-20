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
