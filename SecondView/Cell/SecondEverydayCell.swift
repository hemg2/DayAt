//
//  SecondFiveTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit
import SnapKit
class SecondEverydayCell: UITableViewCell {
    static let identifier = "SecondEverydayCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    var controlSwicth: UISwitch = {
        let swicth = UISwitch()
        //        swicth.setOn(true, animated: true)
        swicth.isOn = true
        //        swicth.translatesAutoresizingMaskIntoConstraints = false
//        swicth.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        swicth.addTarget(SecondEverydayCell.self, action: #selector(onClickSwitch(sender:)), for: .valueChanged)
        return swicth
    }()
    
    @objc func onClickSwitch(sender: UISwitch) {
        var color: UIColor
        print("콕콕콕")
        if sender.isOn {
            color = UIColor.gray
            print("on")
        } else {
            color = UIColor.orange
            print("off")
        }
        self.backgroundColor = color
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(controlSwicth)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.leading.equalTo(15)
        }
        controlSwicth.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.trailing.equalTo(-15)
        }
    }
}


extension SecondEverydayCell {
    public func fiveBind(model: FiveTitle) {
        titleLabel.text = model.title
    }
}
