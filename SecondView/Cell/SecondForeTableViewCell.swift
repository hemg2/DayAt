//
//  SecondForeTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit
import SnapKit
class SecondForeTableViewCell: UITableViewCell {
    static let identifier = "SecondForeTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        return label
    }()
    var controlSwicth: UISwitch = {
        let swicth: UISwitch = UISwitch()
        swicth.layer.position = CGPoint(x: 355, y: 45)
        swicth.isOn = true
        swicth.addTarget(SecondForeTableViewCell.self, action: #selector(onClickSwitch(sender:)), for: UIControl.Event.valueChanged)
        return swicth
    }()
    @objc func onClickSwitch(sender: UISwitch) {
        var text: String
        var color: UIColor
        
        if sender.isOn {
            text = "On"
            color = UIColor.gray
        } else {
            text = "Off"
            color = UIColor.orange
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
    }
}


extension SecondForeTableViewCell {
    public func foredBind(model: ForeTitle) {
        titleLabel.text = model.title
    }
}
