//
//  Extension+String.swift
//  TravelTalk
//
//  Created by 박준우 on 1/12/25.
//

import Foundation

extension String {
    func getyyMMddDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convertedDate = dateFormatter.date(from: self)
        
        dateFormatter.dateFormat = "yy.MM.dd"
        
        return dateFormatter.string(from: convertedDate!)
    }
}
