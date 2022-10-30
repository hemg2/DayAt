//
//  DataBackUpTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit

class DataBackUpTableViewCell: UITableViewCell {
    static let identifier = "cell2"
    
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
    }

}
