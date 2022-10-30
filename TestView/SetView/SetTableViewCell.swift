//
//  SetTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit
import SnapKit

class SetTableViewCell: UITableViewCell {
    static let identifier = "cell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        return label
    }()
    
    var subTitleFirstLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    var subTitleSecondLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()
    
    var subtextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()
    var subtextLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        label.numberOfLines = 3
        return label
    }()
    var subtextLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()
    var subtextLabel3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        label.numberOfLines = 3
        return label
    }()
    var subtextLabel4: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()
    
    var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("구매하기 ($2.99)", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    var buyBackButton: UIButton = {
        let button = UIButton()
        button.setTitle("구매복구", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .red
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 15
        return button
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
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(7)
            make.leading.equalTo(130)
            addSubview(titleLabel)
        }
        subTitleFirstLabel.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.leading.equalTo(90)
            addSubview(subTitleFirstLabel)
        }
        subTitleSecondLabel.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.leading.equalTo(90)
            addSubview(subTitleSecondLabel)
        }
        subtextLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(5)
            addSubview(subtextLabel)
        }
        subtextLabel1.snp.makeConstraints { make in
            make.top.equalTo(83)
            make.leading.equalTo(5)
            addSubview(subtextLabel1)
        }
        subtextLabel2.snp.makeConstraints { make in
            make.top.equalTo(96)
            make.leading.equalTo(5)
            addSubview(subtextLabel2)
        }
        subtextLabel3.snp.makeConstraints { make in
            make.top.equalTo(109)
            make.leading.equalTo(5)
            addSubview(subtextLabel3)
        }
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(130)
            addSubview(buyButton)
        }
        buyBackButton.snp.makeConstraints { make in
            make.top.equalTo(163)
            make.leading.equalTo(center)
            addSubview(buyBackButton)
        }
    }
    
}
