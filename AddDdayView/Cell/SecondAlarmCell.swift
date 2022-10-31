//
//  SecondSevenTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit
import SnapKit

class SecondAlarmCell: UITableViewCell {
    static let identifier = "SecondAlarmCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        return label
    }()
    var titleLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    
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
        contentView.addSubview(titleLabel1)
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
        titleLabel1.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.trailing.equalTo(-10)
        }
    }
}


extension SecondAlarmCell {
    public func sevenBind(model: SevenTitle) {
        titleLabel.text = model.title
        titleLabel1.text = model.subTitle
    }
}
