//
//  SecondViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit

enum CellList: CaseIterable {
    case One
    case Two
    case Three
}

struct Cell {
    let title: String
    let day: String
}

let cellType = CellList.allCases

class SecondViewController: UIViewController {
    let cell = [SecondOneTableViewCell(), SecondTwoTableViewCell(), SecondThreeTableViewCell()]
    
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
        view.addSubview(secondTableView)
        secondTableView.translatesAutoresizingMaskIntoConstraints = false
        secondTableView.register(SecondOneTableViewCell.self, forCellReuseIdentifier: "SecondOneTableViewCell")
        secondTableView.register(SecondTwoTableViewCell.self, forCellReuseIdentifier: "SecondTwoTableViewCell")
        secondTableView.register(SecondThreeTableViewCell.self, forCellReuseIdentifier: "SecondThreeTableViewCell")
        secondTableView.register(SecondForeTableViewCell.self, forCellReuseIdentifier: "SecondForeTableViewCell")
        secondTableView.register(SecondFiveTableViewCell.self, forCellReuseIdentifier: "SecondFiveTableViewCell")
        secondTableView.register(SecondSixTableViewCell.self, forCellReuseIdentifier: "SecondSixTableViewCell")
        secondTableView.register(SecondSevenTableViewCell.self, forCellReuseIdentifier: "SecondSevenTableViewCell")
        secondTableView.register(SecondEightTableViewCell.self, forCellReuseIdentifier: "SecondEightTableViewCell")
        
        secondTableView.rowHeight = 100
        secondTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        secondTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        secondTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        secondTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        secondTableView.delegate = self
        secondTableView.dataSource = self
        secondTableView.allowsMultipleSelection = true
        
    }
    
    func loadData() {
        dataSource.append(.init(title: "시간, 커스텀, 더보기"))
        dataSource2.append(.init(title: "제목을 입력해주세요"))
        dataSource3.append(.init(title: "날짜선택"))
        dataSource4.append(.init(title: "기간으로설정"))
        dataSource5.append(.init(title: "매일 반복"))
        dataSource6.append(.init(title: "위젯 설정"))
        dataSource7.append(.init(title: "알림", subTitle: "끔"))
        dataSource8.append(.init(title: "캐릭터 선택"))
     
    }
    
    
}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
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
//        return testModels[section].models.count
//        return cell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if  indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondOneTableViewCell", for: indexPath) as! SecondOneTableViewCell
            cell.bind(model: dataSource[indexPath.row])
            return cell
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "SecondTwoTableViewCell", for: indexPath) as! SecondTwoTableViewCell
            cell1.secondBind(model: dataSource2	[indexPath.row])
            return cell1
        } else if indexPath.section == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "SecondThreeTableViewCell", for: indexPath) as! SecondThreeTableViewCell
            cell2.threeBind(model: dataSource3[indexPath.row])
            return cell2
        } else if indexPath.section == 3 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "SecondForeTableViewCell", for: indexPath) as! SecondForeTableViewCell
            cell3.foredBind(model: dataSource4[indexPath.row])
//            cell3.controlSwicth = UISwitch()
            return cell3
        } else if indexPath.section == 4 {
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "SecondFiveTableViewCell", for: indexPath) as! SecondFiveTableViewCell
            cell4.fiveBind(model: dataSource5[indexPath.row])
            return cell4
        } else if indexPath.section == 5 {
            let cell5 = tableView.dequeueReusableCell(withIdentifier: "SecondSixTableViewCell", for: indexPath) as! SecondSixTableViewCell
            cell5.sixBind(model: dataSource6[indexPath.row])
            return cell5
        } else if indexPath.section == 6 {
            let cell6 = tableView.dequeueReusableCell(withIdentifier: "SecondSevenTableViewCell", for: indexPath) as! SecondSevenTableViewCell
            cell6.sevenBind(model: dataSource7[indexPath.row])
            cell6.accessoryType = .disclosureIndicator
            return cell6
        } else if indexPath.section == 7 {
            let cell7 = tableView.dequeueReusableCell(withIdentifier: "SecondEightTableViewCell", for: indexPath) as! SecondEightTableViewCell
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
