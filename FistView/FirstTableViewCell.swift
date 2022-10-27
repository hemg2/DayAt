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
        label.font = UIFont.systemFont(ofSize: 20)
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
            make.leading.top.equalTo(20)
            addSubview(dateLabel)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(50)
            addSubview(titleLabel)
        }
        
        dayLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            //                make.bottom.equalToSuperview().offset(-40)
            make.trailing.equalToSuperview().offset(-40)
            //                make.leading.equalToSuperview().offset(40)
            addSubview(dayLabel)
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
