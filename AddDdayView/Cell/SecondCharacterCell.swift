//
//  SecondEightTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit
import SnapKit

class SecondCharacterCell: UITableViewCell {
    static let identifier = "SecondCharacterCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
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
    }
}


extension SecondCharacterCell {
    public func eightBind(model: EightTitle) {
        titleLabel.text = model.title
    }
}
