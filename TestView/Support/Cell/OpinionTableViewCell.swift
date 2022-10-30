//
//  OpinionTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit

class OpinionTableViewCell: UITableViewCell {
    static let identifier = "cell1"
    
    var opinionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
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
        addSubview(opinionLabel)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        opinionLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.leading.equalTo(15)
        }
    }
    
}

extension OpinionTableViewCell {
    public func bind(model: EightTitle) {
        opinionLabel.text = model.title
        
    }
}
