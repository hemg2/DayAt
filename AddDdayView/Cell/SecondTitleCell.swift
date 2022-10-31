//
//  SecondTwoTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import UIKit
import SnapKit

class SecondTitleCell: UITableViewCell {
    static let identifier = "SecondTitleCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.gray
        return label
    }()
    
    var textfield : UITextField = {
       let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "제목을 입력해주세요"
//        textfield.text = "제목 만들어주세요"
        textfield.font = UIFont.systemFont(ofSize: 30)
        textfield.textColor = UIColor.gray
        textfield.layer.cornerRadius = 1
        textfield.layer.borderWidth = 0
        textfield.layer.borderColor = UIColor.gray.cgColor.copy(alpha: 0.7)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))
        textfield.leftView = paddingView
        textfield.leftViewMode = UITextField.ViewMode.always
        
        return textfield
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
//        addSubview(titleLabel)
        contentView.addSubview(textfield)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalTo(10)
//            make.leading.equalTo(10)
//        }
        textfield.snp.makeConstraints { make in
            make.top.equalTo(5)
            make.leading.equalTo(5)
        }
    }
}


extension SecondTitleCell {
    public func secondBind(model: SecondTitle) {
//        titleLabel.text = model.title
        textfield.text = model.title
    }
}
