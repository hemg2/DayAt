//
//  FirstTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit
class FirstTableViewCell: UITableViewCell {
    static let identifier = "cell"
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.red
        return label
    }()
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.blue
        return label
    }()
    var dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.gray
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dateLabel)
        addSubview(titleLabel)
        addSubview(dayLabel)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(15)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(40)
            make.leading.equalTo(15)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-15)
        }
        
    }

}


extension FirstTableViewCell {
    public func bind(model: CustomCellModel) {
        titleLabel.text = model.leftTitle
        dateLabel.text = model.leftdey
        dayLabel.text = model.rightdate
        
    }
}
