//
//  TranslationTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit

class TranslationTableViewCell: UITableViewCell {
    static let identifier = "cell4"

    var translationLabel: UILabel = {
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
        addSubview(translationLabel)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        translationLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.leading.equalTo(15)
        }
    }
    
}

extension TranslationTableViewCell {
    public func bind(model: OneTitle) {
        translationLabel.text = model.title
        
    }
}

