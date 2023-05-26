//
//  TimeInterval+extension.swift
//  ToDo
//
//  Created by Vasanth Kumar on 26/05/23.
//

import Foundation

extension TimeInterval {
    func getString(format: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
