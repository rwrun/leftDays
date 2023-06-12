//
//  Date.ext.swift
//  leftDays
//
//  Created by Ислам Батыргереев on 09.06.2023.
//

import Foundation

extension Date{
    
    func getDifference() -> Int{
        let calendar = Calendar.current
        
        let fromDate = calendar.startOfDay(for: Date.now)
        let toDate = calendar.startOfDay(for: self)
        
        let diffComponents = calendar.dateComponents([.day], from: fromDate, to: toDate)
        
        return diffComponents.day!
    }
    
    func formatDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        
        return formatter.string(from: self)
    }
    
    
}
