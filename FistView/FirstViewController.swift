//
//  FisrtViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    var dataSource = [CustomCellModel]()
    
    var rightNavButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(add))
        return button
    }
    
    @objc func add(_ sender: Any) {
        let secondView = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "홈"
        self.navigationItem.rightBarButtonItem = self.rightNavButton
        
        tableViewLayout()
        
    }
    
    
    func tableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 100
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        dataSource.append(.init(leftTitle: "제목", leftdey: "1월~12월", rightdate: "00%"))
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
//        cell.bind(model: dataSource[indexPath.row])
        cell.dateLabel.text = "date"
        cell.titleLabel.text = "title"
        cell.dayLabel.text = "day"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
