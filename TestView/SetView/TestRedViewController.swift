//
//  TestRedViewController.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit
import SnapKit

class TestRedViewController: UIViewController {
   
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "설정"
        
        tableViewLayout()
      
    }
    
   private func tableViewLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(0)
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(SetTableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.rowHeight = 100
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    

}

extension TestRedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SetTableViewCell
        cell.titleLabel.text = "프로 업그레이드"
        cell.subTitleFirstLabel.text = "업그레이드를 통해 개발자를 지원하고,"
        cell.subTitleSecondLabel.text = "앳의 더 많은 기능을 이용해보세요."
        cell.subtextLabel.text = "-앳을 원하는 만큼 추가 생성할 수 있어요."
        cell.subtextLabel1.text = "-iCloud 백업으로 앳을 지웠다 새롭게 설치하더라도 기록들이 지워지지 않아요."
        cell.subtextLabel2.text = "-잠겨있는 모든 캐릭터, 메인테마, 위젯테마를 사용할 수 있어요."
        cell.subtextLabel3.text = "-앞으로 추괴든 기능, 캐릭터 테마 등 모든 업데이트 내용도 추가 구매없이 사용할 수 있어요."
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
