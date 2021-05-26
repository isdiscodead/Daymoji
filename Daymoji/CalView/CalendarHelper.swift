import Foundation
import UIKit

class CalendarHelper
{
    //캘린더 메소드 즉 내가 호출하는 모든 메소드를 여기다가 다 넣음
    //첫번째 일은 캘린더라는 변수를 선언
    let calendar = Calendar.current
    
    //오른쪽 버튼 다음달로 계산하고 이동시켜주는 함수
    func plusMonth(date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value : 1, to: date)!
    }
    //왼쪽 버튼 이전달로 계산하고 이동시켜주는 함수
    func minusMonth(date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value : -1, to: date)!
    }
    
    //문자열을 반환하기 위해 만들어주는 함수 LLLL이 텍스트로 한 달을 반환 한 다음 다음 날짜 형식 도트 문자열을 반환합니다.
    func monthString(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    // 위와 동일하게 year 즉 년도를 반환
    func yearString(date: Date) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    //주어진 월의 일수를 반환하는 함수 ex) 1월에는 31일 4월엥는 30일을 주어질 수 있게 해주는 함수
    func daysInMonth(date: Date) -> Int
    {
        let range = calendar.range(of : .day, in: .month, for: date)!
        return range.count
    }
    
    //날짜 주어진 달에서 일 구성 요소를 가져와주는 함수
    func dayOfMonth(date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    // 동일한 매개 변수를 가지지만 실제로는 year,month의 초기값설정하는 함수
    func firstOfMonth(date: Date) -> Date
    {
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    // 평일과 평일로 변경해주는 함수
    func weekDay(date: Date) -> Int
    {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
}
