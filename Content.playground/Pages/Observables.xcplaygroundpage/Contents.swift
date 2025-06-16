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
