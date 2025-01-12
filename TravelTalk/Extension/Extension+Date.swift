//
//  Extension+Date.swift
//  TravelTalk
//
//  Created by 박준우 on 1/13/25.
//

import Foundation

extension Date {
    func getyyyyMMddHHmmDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        return dateFormatter.string(from: self)
    }
}
