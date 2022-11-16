//
//  Comment.swift
//  MyCreditManager
//
//  Created by Pane on 2022/11/15.
//

import Foundation

func viewDefaultComment(_ comment: DefaultComment) {
    switch comment {
    case .실행:
        print("""
        원하는 기능을 입력해주세요
        1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료
        """)
    case .학생추가:
        print("추가할 학생의 이름을 입력해주세요")
    case .학생삭제:
        print("삭제할 학생의 이름을 입력해주세요")
    case .성적추가:
        print("""
        성적성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift A+
        만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.
        """)
    case .성적삭제:
        print("""
        성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.
        입력예) Mickey Swift
        """)
    case .평점보기:
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
    }
}

func viewErrorComment(_ error: ErrorComent) {
    switch error {
    case .서브에러:
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    case .학생추가에러:
        return
    case .학생삭제에러:
        return
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

func viewErrorComment(_ error: ErrorComent, _ name: String) {
    switch error {
    case .서브에러:
        return
    case .학생추가에러:
        print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
    case .학생삭제에러, .성적삭제에러, .평점보기에러:
        print("\(name) 학생을 찾지 못했습니다.")
    default:
        return
    }
}

func viewResultComment(_ result: ResultComment) {
    if result == .종료 {
        print("프로그램을 종료합니다...")
    }
}

func viewResultComment(_ result: ResultComment, _ name: String) {
    if result == .학생추가 {
        print("\(name) 학생을 추가했습니다.")
    } else if result == .학생삭제 {
        print("\(name) 학생을 삭제하였습니다.")
    }
}

func viewResultComment(_ result: ResultComment, _ name: String, _ subject: String, _ score: String) {
    if result == .성적추가 {
        print("\(name) 학생의 \(subject) 과목이 \(score)로 추가(변경)되었습니다.")
    }
}

func viewResultComment(_ result: ResultComment, _ name: String, _ subject: String) {
    if result == .성적삭제 {
        print("\(name) 학생의 \(subject) 과목의 성적이 삭제되었습니다.")
    }
}
    
func viewResultComment(_ result: ResultComment, _ subjectData: [String:String]) {
    if result == .평점보기 {
        subjectData.forEach { subject, score in
            print("\(subject): \(score)")
        }
        let average = subjectData.values.map{scoreDic[$0] ?? 0.0}.reduce(0.0,+)/Double(subjectData.keys.count)
        print("평점 : \(trunc(average * 100) / 100)")
    }
}