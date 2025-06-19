import Foundation
import PlaygroundSupport
import RxCocoa
import RxSwift
import UIKit

block("toArray") {
    let disposeBag = DisposeBag()

    Observable.of("A", "B", "C")
        .toArray()
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("map") {
    let disposeBag = DisposeBag()

    Observable.of(1, 2, 3)
        .map { $0 * 2 }
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}
