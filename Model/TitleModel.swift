//
//  Model.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import Foundation
import UIKit


struct CustomCellModel {
    let leftTitle: String
    let leftdey: String
    let rightdate: String
    
    init(leftTitle: String, leftdey: String, rightdate: String) {
        self.leftTitle = leftTitle
        self.leftdey = leftdey
        self.rightdate = rightdate
    }
}

struct OneTitle {
    let title: String
}

struct TwoTitle {
    let title: String
    let subTitle: String
}



struct Support {
    let first: String
    let second: String
    let three: String
    let fore: String
    let five: String
}


struct TextFieldModel {
    var titleFieldData: String?
    
    init(titleFieldData: String) {
        self.titleFieldData = titleFieldData
    }
}
