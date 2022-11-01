//
//  AlarmViewController.swift
//  DayAt
//
//  Created by 1 on 2022/11/01.
//

import UIKit
import SnapKit

class AlarmViewController: UIViewController {
    
    var todayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "당일 알림"
        label.textColor = UIColor.darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        //        label.textAlignment = .left
        return label
    }()
    
    var yesterdayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "전날 알림"
        label.textColor = UIColor.darkGray
        //        label.textAlignment = .left
        return label
    }()
    
    var todaySwicth: UISwitch = {
        let swicth = UISwitch()
        swicth.setOn(true, animated: true)
        swicth.isOn = true
        swicth.translatesAutoresizingMaskIntoConstraints = false
        swicth.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        swicth.addTarget(self, action: #selector(onClickSwitch3(sender:)), for: .valueChanged)
        return swicth
    }()
    
    var yesterdaySwicth: UISwitch = {
        let swicth = UISwitch()
        swicth.setOn(true, animated: true)
        swicth.isOn = true
        swicth.translatesAutoresizingMaskIntoConstraints = false
        swicth.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        swicth.addTarget(self, action: #selector(onClickSwitch3(sender:)), for: .valueChanged)
        return swicth
    }()
    
    @objc func onClickSwitch3(sender: UISwitch) {
        if sender.isOn {
        } else {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "알림뷰"
        view.addSubview(todayLabel)
        view.addSubview(yesterdayLabel)
        view.addSubview(todaySwicth)
        view.addSubview(yesterdaySwicth)
        tagetLayout()
    }
    
    func tagetLayout() {
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(135)
            make.leading.equalTo(15)
        }
        yesterdayLabel.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(15)
        }
        todaySwicth.snp.makeConstraints { make in
            make.top.equalTo(135)
            make.trailing.equalTo(-15)
        }
        yesterdaySwicth.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.trailing.equalTo(-15)
        }
    }
    
    
}
