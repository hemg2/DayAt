//
//  ThreeViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit

class MenuViewController: UIViewController {

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
        let threeView = MainViewController()
        self.navigationController?.pushViewController(threeView, animated: true)
    }
    var dataSource = [OneTitle]()
    var dataSource1 = [OneTitle]()
    var dataSource2 = [OneTitle]()
    var dataSource3 = [OneTitle]()
    
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
        tableView.register(MenuSetCell.self, forCellReuseIdentifier: "ThreeSetCell")
        tableView.register(menuSupportCell.self, forCellReuseIdentifier: "ThreeSupportCell")
        tableView.register(MenuBuyCell.self, forCellReuseIdentifier: "ThreeBuyCell")
        tableView.register(MenuUseCell.self, forCellReuseIdentifier: "ThreesUseCell")
        
        tableView.rowHeight = UITableView.automaticDimension
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

extension MenuViewController: UITableViewDataSource  {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeSetCell", for: indexPath) as! MenuSetCell
            cell.bind(model: dataSource[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeSupportCell", for: indexPath) as! menuSupportCell
            cell.bind(model: dataSource1[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreeBuyCell", for: indexPath) as! MenuBuyCell
            cell.bind(model: dataSource2[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ThreesUseCell", for: indexPath) as! MenuUseCell
            cell.bind(model: dataSource3[indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight  // 셀높이
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let redView = SetViewController()
            self.navigationController?.pushViewController(redView, animated: true)
        } else if indexPath.section == 1 {
            let grayView = TestGrayViewController()
            self.navigationController?.pushViewController(grayView, animated: true)
        } else if indexPath.section == 2 {
            let baclView = SupportViewController()
            self.navigationController?.pushViewController(baclView, animated: true)
        }
    }

    
}


extension MenuViewController: UITableViewDelegate {
}
