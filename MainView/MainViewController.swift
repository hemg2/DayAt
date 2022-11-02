//
//  FisrtViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITextFieldDelegate {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    //실시간 날짜
    let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "ko_kr")
        f.dateFormat = "yyyy/MM/dd ~" //HH:mm:ss
        return f
    }()
    
    var dataSource = [CustomCellModel]()
    
    var rightNavButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(add))
        return button
    }
    var leftNavButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "≡", style: .plain, target: self, action: #selector(left))
        return button
    }
    
    @objc func add(_ sender: Any) {
        let secondView = AddViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    @objc func left(_ sender: Any) {
        let threeView = MenuViewController()
//        threeView.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(threeView, animated: true)
    }
    
        
        


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "홈"
        self.navigationItem.rightBarButtonItem = rightNavButton
        self.navigationItem.leftBarButtonItem = leftNavButton
        
        tableViewLayout()
//        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableViewLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(0)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
//            tableView.rowHeight = UITableView.automaticDimension
            tableView.rowHeight = 100
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
//    func loadData() {
//        dataSource.append(.init(leftTitle: "제목1", leftdey: "1월~12월1", rightdate: "01%"))
//        dataSource.append(.init(leftTitle: "제목2", leftdey: "1월~12월2", rightdate: "02%"))
//        dataSource.append(.init(leftTitle: "제목3", leftdey: "1월~12월3", rightdate: "03%"))
//    }
    
  
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            MainTableViewCell()
            return 1
        }
        else if section == 1 {
            MainTableViewCell()
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell
        else { fatalError() }
        
        let currentTime = formatter.string(from: Date())
        let selectionTime = UserDefaults.standard.string(forKey: "day")
        cell.currentTime.text = currentTime
        + "\(cell.selectionTimeLabel.text = "\(String(describing: selectionTime))")"
        
        
        print("date피커2번확인\(String(describing: UserDefaults.standard.string(forKey: "day")))")

        cell.titleLabel.text = "\(String(describing: UserDefaults.standard.string(forKey: "title")!))"
//        print("뷰컨1번확인\(String(describing: UserDefaults.standard.string(forKey: "title1")))") 값불러오기
        cell.dayLabel.text = "%"
//        cell.dayLabel.text = "\((formatter.string(from: Date())))" - "\((UserDefaults.standard.string(forKey: "day")))%"
        return cell
    }
    
    // 디데이 계산법 디데이 - 투데이 = 벨류값을 저장한다

    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let actions1 = UIContextualAction(style: .normal, title: "Delete", handler: { action, view, completionHaldler in
            completionHaldler(true)
//            let cell = self.dataSource.remove(at: indexPath.row)
            let _ = UserDefaults.standard.removeObject(forKey: "title")
            tableView.reloadData()
        })
        actions1.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [actions1])
    }
    
}


