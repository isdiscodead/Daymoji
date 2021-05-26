import UIKit

class CalendarView : UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var selectedDate = Date() // 선택된 날짜
    var totalSquares = [String]() // 날짜를 입력 한 다음 String에 저장
    
    //스토리보드에 있는 화면에 적용시켜주는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView() // 함수호출 코드
        setMonthView() //
    }
    
    
    //문자열의 배열인 총 제곱을 설정 한 다음 이를 호출하는 함수입니다. 캘린더의 틀을 만드는 부분
    func setCellsView() {
        let width = (CollectionView.frame.size.width - 2 ) / 8 // 넓이
        let height = (CollectionView.frame.size.height - 2) / 8 // 높이
        
        //레이아웃에 맞게 크기를 설정해줌
        let flowLayout = CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        //너비와 높이를 지정하고 달력을 가져옴
        flowLayout.itemSize = CGSize(width: width, height : height)
    }
    
    //월별보기를 설정, 월,일,요일을 정의 CalendarHelper에서 선택한 날짜로부터 월별 날짜를 가져 오도록해주는 함수
    func setMonthView(){
        totalSquares.removeAll()
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int =  1
        
        while(count <= 42)
        {
            if(count <= startingSpaces || count - startingSpaces > daysInMonth)
            
            {
                totalSquares.append("")
            }
            else
            {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        //캘린더의 공간을 확보해주는 코드입니다.
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
            + " " + CalendarHelper().yearString(date: selectedDate)
        CollectionView.reloadData()
        
    }
    
    // uicollectionview의 데이터값을 가져오기 위한 함수입니다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    // uicollectionview의 데이터값을 가져오기 위한 함수입니다. (동일)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        // calCell이라는 이름을 지정 후 나중에 여기로 데이터를 보내라는 뜻 identifier에 calCell 입력
        cell.dayOfMonth.text = totalSquares[indexPath.item]
        
        return cell
    }
    
    // 이전달을 불러와주는 보조 역할
    @IBAction func previousMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    // 다음달을 불러와주는 보조 역할
    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
}
