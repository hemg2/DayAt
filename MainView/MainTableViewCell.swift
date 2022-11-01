//
//  FirstTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit
class MainTableViewCell: UITableViewCell {
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
    var slider: UISlider {
        let greenSlider = UISlider(frame: CGRect(x: 20, y: 80, width: 350, height: 10))
        greenSlider.backgroundColor = UIColor.white
        greenSlider.layer.cornerRadius = 10.0
        greenSlider.layer.shadowOpacity = 0.5
        greenSlider.layer.masksToBounds = false
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 10
        greenSlider.value = 0.5
        greenSlider.maximumTrackTintColor = UIColor.gray
        greenSlider.minimumTrackTintColor = UIColor.black
        greenSlider.addTarget(self, action: #selector(onChangeValueSlider(sender:)), for: UIControl.Event.valueChanged)
        return greenSlider
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @objc func onChangeValueSlider(sender: UISlider){
        
    }
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dayLabel)
        contentView.addSubview(slider)
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
