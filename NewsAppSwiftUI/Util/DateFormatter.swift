//
//  DateFormatter.swift
//  NewsAppSwiftUI
//
//  Created by Piotr Kozłowski on 17/11/2019.
//  Copyright © 2019 Piotr Kozłowski. All rights reserved.
//

import Foundation

class DateTimeFormatter {
    
    static func readableDate(dateString: String) -> String {
        let date = toDate(dateString: dateString, format: Constants.DATE_FORMAT)
    
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from:date)
    }
    
    private static func toDate(dateString: String, format: String) -> Date {
        let isoFormatter = DateFormatter()
        isoFormatter.dateFormat = format
        isoFormatter.locale = Locale(identifier: "en_US_POSIX")
        isoFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return isoFormatter.date(from: dateString)!
    }
    
}


