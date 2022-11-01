//
//  SupportTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/30.
//

import UIKit

class SupportTableViewCell: UITableViewCell {
    static let identifier = "cell"
    
    var evaluationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.black
        return label
    }()
//    var opinionLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = UIColor.red
//        return label
//    }()
//    var facebookLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = UIColor.red
//        return label
//    }()
//    var instagramLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = UIColor.red
//        return label
//    }()
//    var translationLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = UIColor.red
//        return label
//    }()
    
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
        addSubview(evaluationLabel)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        evaluationLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.leading.equalTo(15)
        }
    }
    
}

extension SupportTableViewCell {
    public func bind(model: OneTitle) {
        evaluationLabel.text = model.title
        
    }
}
