//
//  SecondThreeTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit

class SecondDayCell: UITableViewCell {
    static let identifier = "SecondDayCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        return label
    }()
    var dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.preferredDatePickerStyle = .compact
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        return datePicker
    }()
    
    @objc func onDidChangeDate(sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm:"
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
//        let selectedDate: String = dateFormatter.string(from: sender.date)
        

    }
    
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
        contentView.addSubview(dayLabel)
        contentView.addSubview(datePicker)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(10)
        }
        dayLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.trailing.equalTo(-15)
        }
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(110)
        }
    }
}


extension SecondDayCell {
    public func threeBind(model: ThreeTitle) {
        titleLabel.text = model.title
        dayLabel.text = model.subTitle
    }
}
