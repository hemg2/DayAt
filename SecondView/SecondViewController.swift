//
//  SecondViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit


class SecondViewController: UIViewController, SecondtermCellDelegate {
    func cellSwicth() {
        print("클릭")
    }
    
    private lazy var secondTableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    var rightNavButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(add))
        return button
    }
    
    @objc func add(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var dataSource = [FirstTitle]()
    var dataSource2 = [SecondTitle]()
    var dataSource3 = [ThreeTitle]()
    var dataSource4 = [ForeTitle]()
    var dataSource5 = [FiveTitle]()
    var dataSource6 = [SixTitle]()
    var dataSource7 = [SevenTitle]()
    var dataSource8 = [EightTitle]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "NEW"
        self.navigationItem.rightBarButtonItem = self.rightNavButton
        tableViewLayout()
        loadData()
    }
    
    func tableViewLayout() {
        secondTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(0)
            view.addSubview(secondTableView)
            secondTableView.translatesAutoresizingMaskIntoConstraints = false
            secondTableView.register(SecondMenuCell.self, forCellReuseIdentifier: "SecondMenuCell")
            secondTableView.register(SecondTitleCell.self, forCellReuseIdentifier: "SecondTitleCell")
            secondTableView.register(SecondDayCell.self, forCellReuseIdentifier: "SecondDayCell")
            secondTableView.register(SecondtermCell.self, forCellReuseIdentifier: "SecondtermCell")
            secondTableView.register(SecondEverydayCell.self, forCellReuseIdentifier: "SecondEverydayCell")
            secondTableView.register(SecondSetCell.self, forCellReuseIdentifier: "SecondSetCell")
            secondTableView.register(SecondAlarmCell.self, forCellReuseIdentifier: "SecondAlarmCell")
            secondTableView.register(SecondCharacterCell.self, forCellReuseIdentifier: "SecondCharacterCell")
            
            secondTableView.rowHeight = 100
            secondTableView.delegate = self
            secondTableView.dataSource = self
            secondTableView.allowsMultipleSelection = true
        }
    }
    
    func loadData() {
        dataSource.append(.init(title: "시간, 커스텀, 더보기"))
        dataSource2.append(.init(title: "제목을 입력해주세요"))
        dataSource3.append(.init(title: "날짜선택", subTitle: "기본달력"))
        dataSource4.append(.init(title: "기간으로설정"))
        dataSource5.append(.init(title: "매일 반복"))
        dataSource6.append(.init(title: "위젯 설정"))
        dataSource7.append(.init(title: "알림", subTitle: "끔"))
        dataSource8.append(.init(title: "캐릭터 선택"))
     
    }

}


extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dataSource.count
        } else if section == 1 {
            return dataSource2.count
        } else if section == 2 {
            return dataSource3.count
        } else if section == 3 {
            return dataSource4.count
        } else if section == 4 {
            return dataSource5.count
        } else if section == 5 {
            return dataSource6.count
        } else if section == 6 {
            return dataSource7.count
        } else if section == 7 {
            return dataSource8.count
        }
        return 0

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondMenuCell", for: indexPath) as! SecondMenuCell
            cell.bind(model: dataSource[indexPath.row])
            return cell
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "SecondTitleCell", for: indexPath) as! SecondTitleCell
            cell1.secondBind(model: dataSource2	[indexPath.row])
            return cell1
        } else if indexPath.section == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "SecondDayCell", for: indexPath) as! SecondDayCell
            cell2.threeBind(model: dataSource3[indexPath.row])
            return cell2
        } else if indexPath.section == 3 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "SecondtermCell", for: indexPath) as! SecondtermCell
            cell3.foredBind(model: dataSource4[indexPath.row])
            cell3.deleegate = self
            //            cell3.controlSwicth = UISwitch()
            return cell3
        } else if indexPath.section == 4 {
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "SecondEverydayCell", for: indexPath) as! SecondEverydayCell
            cell4.fiveBind(model: dataSource5[indexPath.row])
            return cell4
        } else if indexPath.section == 5 {
            let cell5 = tableView.dequeueReusableCell(withIdentifier: "SecondSetCell", for: indexPath) as! SecondSetCell
            cell5.sixBind(model: dataSource6[indexPath.row])
            return cell5
        } else if indexPath.section == 6 {
            let cell6 = tableView.dequeueReusableCell(withIdentifier: "SecondAlarmCell", for: indexPath) as! SecondAlarmCell
            cell6.sevenBind(model: dataSource7[indexPath.row])
            cell6.accessoryType = .disclosureIndicator
            return cell6
        } else if indexPath.section == 7 {
            let cell7 = tableView.dequeueReusableCell(withIdentifier: "SecondCharacterCell", for: indexPath) as! SecondCharacterCell
            cell7.eightBind(model: dataSource8[indexPath.row])
            return cell7
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80  // 셀높이
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10//testModels.count// 걍 숫자로 표현 셀 갯수
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
      
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "시간, 커스텀, 더보기"
//        case 1: return "2"
//        case 2: return "3"
//        case 3: return "4"
//        case 4: return "5"
//        default: return nil
//        }
//    }
    
}

extension SecondViewController: UITableViewDelegate {
  
}
