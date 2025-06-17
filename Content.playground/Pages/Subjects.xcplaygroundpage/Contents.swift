import Foundation
import PlaygroundSupport
import RxCocoa
import RxSwift
import UIKit

block("publishSubject") {
    let subject: PublishSubject<String> = PublishSubject()

    subject.onNext("A")

    let subscription1 = subject.subscribe {
        print("1", $0)
    }

    subject.onNext("B")

    let subscription2 = subject.subscribe {
        print("2", $0)
    }

    subject.onNext("C")

    subscription1.dispose()

    subject.onNext("D")

    subject.onCompleted()

    subject.onNext("E")

    subscription2.dispose()

    let subscription3 = subject.subscribe {
        print("3", $0)
    }

    subject.onNext("F")

    subscription3.dispose()
}

block("behaviorSubject") {
    let subject: BehaviorSubject<String> = BehaviorSubject(value: "A")

    let subscription1 = subject.subscribe {
        print("1", $0)
    }

    subject.onNext("B")

    let subscription2 = subject.subscribe {
        print("2", $0)
    }

    subject.onNext("C")

    subscription1.dispose()

    subject.onNext("D")

    subject.onCompleted()

    subject.onNext("E")

    subscription2.dispose()

    let subscription3 = subject.subscribe {
        print("3", $0)
    }

    subject.onNext("F")

    subscription3.dispose()
}
