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
