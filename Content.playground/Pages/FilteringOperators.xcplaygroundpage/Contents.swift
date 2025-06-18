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
