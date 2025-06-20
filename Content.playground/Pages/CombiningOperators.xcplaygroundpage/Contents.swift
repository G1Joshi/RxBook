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
