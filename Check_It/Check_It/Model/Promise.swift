//
//  Promise.swift
//  Check_It
//
//  Created by 김응관 on 2023/01/05.
//

import Foundation

struct Promise: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var promiseName: String // 약속이름
    var limit: String// 결석 구분(30분)
    var lateLimit: String //지각 구분(5분)

    var rangeLimit: Int // 출석확인 가능 거리범위
    var location: String // 위치
    var date: String // 날짜 -> 문자열 형식으로 등록
    var startTime: String // 약속 시작시간
    var endTime: String // 약속 종료시간

}
