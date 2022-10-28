//
//  ThreeViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit

class ThreeViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    var dataSource = [ThreeViewTitle]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "메뉴"
        tableViewLayout()
        loadData()

        // Do any additional setup after loading the view.
    }
    
    func tableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ThreeTableViewCell.self, forCellReuseIdentifier: "ThreeTableViewCell")
        tableView.rowHeight = 100
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        dataSource.append(.init(title: "설정"))
    }
    
}

extension ThreeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeTableViewCell", for: indexPath) as! ThreeTableViewCell
        cell.bind(model: dataSource[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70  // 셀높이
    }

    
}
