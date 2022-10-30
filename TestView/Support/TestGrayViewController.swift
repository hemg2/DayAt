//
//  TestGrayViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit
import SnapKit

class TestGrayViewController: UIViewController {
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    lazy var dataSource = [EightTitle]()
    lazy var dataSource1 = [EightTitle]()
    lazy var dataSource2 = [EightTitle]()
    lazy var dataSource3 = [EightTitle]()
    lazy var dataSource4 = [EightTitle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "고객 지원"
       tableViewLayout()
        loadData()
    }
    
    func tableViewLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(0)
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(SupportTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.register(OpinionTableViewCell.self, forCellReuseIdentifier: "cell1")
            tableView.register(FacebookTableViewCell.self, forCellReuseIdentifier: "cell2")
            tableView.register(InstagramTableViewCell.self, forCellReuseIdentifier: "cell3")
            tableView.register(TranslationTableViewCell.self, forCellReuseIdentifier: "cell4")
            tableView.rowHeight = 100
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    func loadData() {
        dataSource.append(.init(title: "평가하기"))
        dataSource1.append(.init(title: "의견보내기"))
        dataSource2.append(.init(title: "페이스북"))
        dataSource3.append(.init(title: "인스타그램"))
        dataSource4.append(.init(title: "번역 참여하기"))
    }
   
}


extension TestGrayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return dataSource.count
        } else if section == 1 {
           return dataSource1.count
        } else if section == 2 {
            return dataSource2.count
        } else if section == 3 {
            return dataSource3.count
        } else if section == 4 {
            return dataSource4.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SupportTableViewCell
            cell.bind(model:dataSource[indexPath.row])
//            cell.evaluationLabel.text = "평가하기"
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! OpinionTableViewCell
            cell.bind(model:dataSource1[indexPath.row])
//            cell.opinionLabel.text = "의견보내기"
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! FacebookTableViewCell
            cell.bind(model:dataSource2[indexPath.row])
//            cell.facebookLabel.text = "페이스북"
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! InstagramTableViewCell
            cell.bind(model:dataSource3[indexPath.row])
//            cell.instagramLabel.text = "인스타그램"
            cell.accessoryType = .disclosureIndicator
            return cell
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! TranslationTableViewCell
            cell.bind(model:dataSource4[indexPath.row])
//            cell.translationLabel.text = "번역 참여하기"
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        return UITableViewCell()
//        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
}
