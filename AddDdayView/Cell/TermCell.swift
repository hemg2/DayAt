//
//  SecondForeTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit
import SnapKit



class TermCell: UITableViewCell {
    static let identifier = "TermCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    private lazy var controlSwicth: UISwitch = {
        let swicth = UISwitch()
        swicth.setOn(true, animated: true)
        swicth.isOn = false
        swicth.translatesAutoresizingMaskIntoConstraints = false
        swicth.onTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        swicth.addTarget(self, action: #selector(onClickSwitch3(sender:)), for: .valueChanged)
        UserDefaults.standard.set(swicth.isOn, forKey: "onClickSwitch3")
        return swicth
    }()
    
    @objc func onClickSwitch3(sender: UISwitch) {
//        var color: UIColor
//        print("콕콕콕")
        var on = SwitchOnCell()
        var off = DayCell()
        if sender.isOn {
            on.isHidden
        } else {
            off.isHidden
        }
//        self.backgroundColor = color
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(controlSwicth)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(15)
        }
        controlSwicth.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.trailing.equalTo(-15)
        }
    }
   
}

//
//extension TermCell {
//    public func fourBind(model: ForeTitle) {
//        titleLabel.text = model.title
//    }
//}
