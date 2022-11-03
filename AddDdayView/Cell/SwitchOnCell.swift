//
//  SwitchOnTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/11/03.
//

import UIKit

class SwitchOnCell: UITableViewCell {
    static let identifier = "SwitchOnCell"
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    var startLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    var endLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    lazy var startDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.preferredDatePickerStyle = .compact
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        return datePicker
    }()
    lazy var endDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = UIColor.white
        datePicker.preferredDatePickerStyle = .compact
        datePicker.layer.cornerRadius = 5.0
        datePicker.layer.shadowOpacity = 0.5
        datePicker.addTarget(self, action: #selector(onDidChangeDate(sender:)), for: .valueChanged)
        return datePicker
    }()
    
    @objc func onDidChangeDate(sender: UIDatePicker){
        let swiftDatePickerView = sender
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        let selectedDate = dateFormatter.string(from: sender.date)
        UserDefaults.standard.set(swiftDatePickerView.date, forKey: "day")
        UserDefaults.standard.set(selectedDate, forKey: "day")
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
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(startLabel)
        contentView.addSubview(endLabel)
        contentView.addSubview(startDatePicker)
        contentView.addSubview(endDatePicker)
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
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.trailing.equalTo(-15)
        }
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.leading.equalTo(15)
        }
        endLabel.snp.makeConstraints { make in
            make.top.equalTo(95)
            make.leading.equalTo(15)
        }
        startDatePicker.snp.makeConstraints { make in
            make.top.equalTo(45)
            make.leading.equalTo(100)
        }
        endDatePicker.snp.makeConstraints { make in
            make.top.equalTo(95)
            make.leading.equalTo(100)
        }
        
    }
   
}
