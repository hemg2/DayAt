//
//  SecondViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit


class AddViewController: UIViewController {
    
    let ud = UserDefaults.standard
    
    let a = MainTableViewCell()
    let aa = TitleCell()
    let datepicker = DayCell()
    
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
//        ud.set(aa.textfield.text, forKey: "title") //값저장
        ud.set(aa.self.textfield.text, forKey: "title")
        ud.set("- 서울!", forKey: "title2")
        ud.set(datepicker.self.datePicker.date, forKey: "day")
//        print("add\(ud.set(aa.textfield.text, forKey: "title"))")
        self.navigationController?.popViewController(animated: true)
    }
    
    var dataSource = [OneTitle]()
    var dataSource2 = [OneTitle]()
    var dataSource3 = [TwoTitle]()
    var dataSource4 = [OneTitle]()
    var dataSource5 = [OneTitle]()
    var dataSource6 = [OneTitle]()
    var dataSource7 = [TwoTitle]()
    var dataSource8 = [OneTitle]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "NEW"
        self.navigationItem.rightBarButtonItem = self.rightNavButton
        ud.set(aa.textfield.text, forKey: "title")
        tableViewLayout()
        loadData()
       
    }
   
    
    func tableViewLayout() {
        secondTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(0)
            secondTableView.translatesAutoresizingMaskIntoConstraints = false
            secondTableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
            secondTableView.register(TitleCell.self, forCellReuseIdentifier: "TitleCell")
            secondTableView.register(DayCell.self, forCellReuseIdentifier: "DayCell")
            secondTableView.register(TermCell.self, forCellReuseIdentifier: "TermCell")
            secondTableView.register(EverydayCell.self, forCellReuseIdentifier: "EverydayCell")
            secondTableView.register(SetCell.self, forCellReuseIdentifier: "SetCell")
            secondTableView.register(AlarmCell.self, forCellReuseIdentifier: "AlarmCell")
            secondTableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
            secondTableView.rowHeight = UITableView.automaticDimension
//            UIView.setAnimationsEnabled(true)
            secondTableView.rowHeight = UITableView.automaticDimension
//            secondTableView.estimatedRowHeight = 130
            secondTableView.delegate = self
            secondTableView.dataSource = self
//            secondTableView.allowsMultipleSelection = true
        }
    }
    
    func loadData() {
        dataSource.append(.init(title: ""))
        dataSource2.append(.init(title: ""))
        dataSource3.append(.init(title: "", subTitle: ""))
        dataSource4.append(.init(title: ""))
        dataSource5.append(.init(title: ""))
        dataSource6.append(.init(title: ""))
        dataSource7.append(.init(title: "", subTitle: ""))
        dataSource8.append(.init(title: ""))

    }

}


extension AddViewController: UITableViewDataSource {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
            
            cell.titleLabel.text = "D-day 설정"
            return cell
            
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as! TitleCell
            cell1.textfield.text = ""
            ud.set(cell1.textfield.text, forKey: "title")
            print("cell \(ud.set(cell1.textfield.text, forKey: "title"))")
//            cell1.textfield.text = ud.set(aa.textfield.text, forKey: "title")
            return cell1

            
        } else if indexPath.section == 2 {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayCell
            cell2.titleLabel.text = "날짜 선택"
            cell2.dayLabel.text = "기본 달력"
            return cell2
        } else if indexPath.section == 3 {
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "TermCell", for: indexPath) as! TermCell
            cell3.titleLabel.text = "기간으로 설정"
            return cell3
        } else if indexPath.section == 4 {
            let cell4 = tableView.dequeueReusableCell(withIdentifier: "EverydayCell", for: indexPath) as! EverydayCell
            cell4.titleLabel.text = "매일 반복"
            return cell4
        } else if indexPath.section == 5 {
            let cell5 = tableView.dequeueReusableCell(withIdentifier: "SetCell", for: indexPath) as! SetCell
            cell5.titleLabel.text = "위젯 설정"
            return cell5
        } else if indexPath.section == 6 {
            let cell6 = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath) as! AlarmCell
            cell6.titleLabel.text = "알림"
            cell6.subTitleLabel.text = "끔"
            cell6.accessoryType = .disclosureIndicator
            return cell6
        } else if indexPath.section == 7 {
            let cell7 = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
            cell7.titleLabel.text = "케릭터 선택"
            return cell7
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return secondTableView.rowHeight  // 셀높이
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10//testModels.count// 걍 숫자로 표현 셀 갯수
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 6 {
            let view = AlarmViewController()
            self.navigationController?.pushViewController(view, animated: true)
        }
      
    }


    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return ""
//        case 1: return ""
//        case 2: return "날짜란"
//        case 3: return "기간란"
//        case 4: return "반복란"
//        case 5: return "설정란"
//        case 6: return "알림란"
//        case 7: return "선택란"
        default: return nil
        }
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableView.automaticDimension

//    }
    
}

extension AddViewController: UITableViewDelegate {
    
}
