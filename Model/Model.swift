//
//  Model.swift
//  DayAt
//
//  Created by 1 on 2022/10/27.
//

import Foundation


struct CustomCellModel {
    let leftTitle: String
    let leftdey: String
    let rightdate: String
}

struct FirstTitle {
    let title: String
}

struct SecondTitle {
    let title: String
}

struct ThreeTitle {
    let title: String
}

//struct Model {
//    let first: [FirstTitle]
//    let second: [SecondTitle]
//    let three: [ThreeTitle]
//}


enum CellModel {
    case one(title: String)
    case two(title: String)
    case three(title: String)
}
