//
//  ThreeTwoTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/29.
//

import UIKit

class ThreeTwoTableViewCell: UITableViewCell {
    static let identifier = "ThreeTwoTableViewCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.gray
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
        addSubview(titleLabel)
        configure()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(15)
        }
    }
}

extension ThreeTwoTableViewCell {
    public func bind(model: ThreeViewTitle) {
        titleLabel.text = model.title
    }
}
