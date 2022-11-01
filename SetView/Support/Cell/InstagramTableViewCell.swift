//
//  InstagramTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit

class InstagramTableViewCell: UITableViewCell {
    static let identifier = "cell3"

    var instagramLabel: UILabel = {
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
        addSubview(instagramLabel)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        instagramLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.leading.equalTo(15)
        }
    }
    
}

extension InstagramTableViewCell {
    public func bind(model: OneTitle) {
        instagramLabel.text = model.title

    }
}

