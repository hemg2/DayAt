//
//  SecondViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
   
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
    private var testDataSourec = [CellModel]()
    
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
        secondTableView.register(SecondThreeTableViewCell.self, forCellReuseIdentifier: "SecondTwoTableViewCell")
        secondTableView.rowHeight = 100
        secondTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        secondTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        secondTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        secondTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        secondTableView.delegate = self
        secondTableView.dataSource = self
        secondTableView.allowsMultipleSelection = true

        
    }
    
    private func loadData() {
        dataSource.append(.init(title: "시간"))
        dataSource2.append(.init(title: "제목"))
        dataSource3.append(.init(title: "날짜선택"))
        secondTableView.reloadData()
    }
  
    
}


extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dataSource.count
        case 1:
            return dataSource2.count
        case 2:
            return dataSource3.count
        default:
            return 0
        }
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondOneTableViewCell", for: indexPath) as! SecondOneTableViewCell
        cell.bind(model: dataSource[indexPath.row])
        return cell
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "SecondTwoTableViewCell", for: indexPath) as! SecondTwoTableViewCell
        cell1.secondBind(model: dataSource2[indexPath.row])
        return cell1

        let cell2 = tableView.dequeueReusableCell(withIdentifier: "SecondTwoTableViewCell", for: indexPath) as! SecondThreeTableViewCell
        cell2.threeBind(model: dataSource3[indexPath.row])
        return cell2
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 8// 1번색션 현재 날씨  2번색션 날씨 예보
        }
    
}
