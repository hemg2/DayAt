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
    
    var leftNavButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "x", style: .plain, target: self, action: #selector(left))
        return button
    }
    @objc func left(_ sender: Any) {
        let threeView = FirstViewController()
        self.navigationController?.pushViewController(threeView, animated: true)
    }
    var dataSource = [ThreeViewTitle]()
    var dataSource1 = [ThreeViewTitle]()
    var dataSource2 = [ThreeViewTitle]()
    var dataSource3 = [ThreeViewTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "메뉴"
        self.navigationItem.leftBarButtonItem = leftNavButton
        tableViewLayout()
        loadData()

        // Do any additional setup after loading the view.
    }
    
    func tableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ThreeSetCell.self, forCellReuseIdentifier: "ThreeSetCell")
        tableView.register(ThreeSupportCell.self, forCellReuseIdentifier: "ThreeSupportCell")
        tableView.register(ThreeBuyCell.self, forCellReuseIdentifier: "ThreeBuyCell")
        tableView.register(ThreesUseCell.self, forCellReuseIdentifier: "ThreesUseCell")
        
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
        dataSource1.append(.init(title: "고객지원"))
        dataSource2.append(.init(title: "구매 복구"))
        dataSource3.append(.init(title: "사용법 다시보기"))
    }
    
}

extension ThreeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return dataSource.count
        } else if section == 1 {
            return dataSource1.count
        } else if section == 2 {
            return dataSource2.count
        } else if section == 3 {
            return dataSource3.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeSetCell", for: indexPath) as! ThreeSetCell
            cell.bind(model: dataSource[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeSupportCell", for: indexPath) as! ThreeSupportCell
            cell.bind(model: dataSource1[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeBuyCell", for: indexPath) as! ThreeBuyCell
            cell.bind(model: dataSource2[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreesUseCell", for: indexPath) as! ThreesUseCell
            cell.bind(model: dataSource3[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70  // 셀높이
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}
