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
    var leftNavButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "-", style: .plain, target: self, action: #selector(left))
        return button
    }
    
    @objc func add(_ sender: Any) {
        let secondView = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    @objc func left(_ sender: Any) {
        let threeView = ThreeViewController()
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
        loadData()
    }
    
    
    func tableViewLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(0)
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.rowHeight = 100
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    func loadData() {
        dataSource.append(.init(leftTitle: "제목1", leftdey: "1월~12월1", rightdate: "01%"))
        dataSource.append(.init(leftTitle: "제목2", leftdey: "1월~12월2", rightdate: "02%"))
        dataSource.append(.init(leftTitle: "제목3", leftdey: "1월~12월3", rightdate: "03%"))
        
    }
    
  
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FirstTableViewCell
        cell.bind(model: dataSource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //스와이프구현
        let actions1 = UIContextualAction(style: .normal, title: "Delete", handler: { action, view, completionHaldler in
            completionHaldler(true)  //셀 지우기
            let cell = self.dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        })
        actions1.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [actions1])
    }
}
