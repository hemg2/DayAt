//
//  ThreeTableViewCell.swift
//  DayAt
//
//  Created by 1 on 2022/10/28.
//

import UIKit

class MenuSetCell: UITableViewCell {
    static let identifier = "ThreeSetCell"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.gray
        return label
    }()
    //    var qaLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = UIFont.systemFont(ofSize: 15)
    //        label.textColor = UIColor.black
    //        return label
    //    }()
    //    var buyLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = UIFont.systemFont(ofSize: 15)
    //        label.textColor = UIColor.black
    //        return label
    //    }()
    //    var useLabel: UILabel = {
    //        let label = UILabel()
    //        label.font = UIFont.systemFont(ofSize: 15)
    //        label.textColor = UIColor.black
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
        addSubview(titleLabel)
        configure()
        //        addSubview(qaLabel)
        //        addSubview(buyLabel)
        //        addSubview(useLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(15)
            make.leading.equalTo(15)
        }
    }
}

extension MenuSetCell {
    public func bind(model: OneTitle) {
        titleLabel.text = model.title
    }
}
