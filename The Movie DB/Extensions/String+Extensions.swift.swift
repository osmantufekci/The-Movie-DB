//
//  String+Extensions.swift.swift
//  The Movie DB
//
//  Created by BIMSER on 28.03.2022.
//

import Foundation


extension String {
    func turkishFormat() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let date = formatter.date(from: self)
        formatter.dateFormat = "dd.MM.yyyy"
        guard let date = date else {
            return self
        }

        let stringDate = formatter.string(from: date)
        return stringDate
    }
}
