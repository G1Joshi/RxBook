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

block("enumerated") {
    let disposeBag = DisposeBag()

    Observable.of(0, 1, 2, 3, 4)
        .enumerated()
        .map {
            $0 % 2 == 0 ? $1 * 2 : $1 * 3
        }
        .subscribe {
            print($0)
        }
        .disposed(by: disposeBag)
}

block("flatMap") {
    struct Score {
        let score: BehaviorSubject<Int>
    }

    let disposeBag = DisposeBag()

    let a = Score(score: BehaviorSubject(value: 80))
    let b = Score(score: BehaviorSubject(value: 90))

    let c = PublishSubject<Score>()

    c.flatMap {
        $0.score
    }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

    c.onNext(a)
    a.score.onNext(85)

    c.onNext(b)
    a.score.onNext(95)
    b.score.onNext(100)
}

block("flatMapLatest") {
    struct Score {
        let score: BehaviorSubject<Int>
    }

    let disposeBag = DisposeBag()

    let a = Score(score: BehaviorSubject(value: 80))
    let b = Score(score: BehaviorSubject(value: 90))

    let c = PublishSubject<Score>()

    c.flatMapLatest {
        $0.score
    }
    .subscribe {
        print($0)
    }
    .disposed(by: disposeBag)

    c.onNext(a)
    a.score.onNext(85)

    c.onNext(b)
    a.score.onNext(95)
    b.score.onNext(100)
}

block("materializeDematerialize") {
    struct Score {
        let score: BehaviorSubject<Int>
    }

    let disposeBag = DisposeBag()

    let a = Score(score: BehaviorSubject(value: 80))
    let b = Score(score: BehaviorSubject(value: 90))

    let c = PublishSubject<Score>()

    let score = c.flatMapLatest {
        $0.score.materialize()
    }

    score.subscribe {
        print("materialize", $0)
    }
    .disposed(by: disposeBag)

    score
        .dematerialize()
        .subscribe {
            print("dematerialize", $0)
        }
        .disposed(by: disposeBag)

    c.onNext(a)
    a.score.onNext(85)

    c.onNext(b)
    a.score.onNext(95)
    b.score.onNext(100)
}
