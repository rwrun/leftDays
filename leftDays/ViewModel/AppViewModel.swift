//
//  AppViewModel.swift
//  leftDays
//
//  Created by Ислам Батыргереев on 09.06.2023.
//

import Foundation

class AppViewModel: ObservableObject{
    
    @Published var mainText = ""
    @Published var endDate = Date.now.formatDate()
    
    let userDefault = UserDefaults.standard
    
    init(){
        getText()
    }
    
    //save text
    func saveNewDateTex(text: String, date: Date){
        userDefault.set(text, forKey: "text")
        userDefault.set(date, forKey: "endDate")
        setText(text: text, date: date)
        
    }
    
    //set text
    private func setText(text: String, date: Date){
        if let formattedText = formatText(text: text, date: date){
            self.mainText = formattedText
            self.endDate = date.formatDate()
        }
    }
    
    //get text
    private func getText(){
        if let savedText = userDefault.string(forKey: "text"),
           let date = userDefault.object(forKey: "endDate") as? Date{
            setText(text: savedText, date: date)
        }
    }
   
    
    // Party after {date} days
    
    private func formatText(text: String, date: Date) -> String?{
        
        guard let range = text.range(of: "{date}") else { return nil }
        
        let startPosition = text.distance(from: text.startIndex, to: range.lowerBound)
        let endPosition = text.distance(from: text.startIndex, to: range.upperBound)
        
        let begin = text[0..<startPosition]
        let endText = text[endPosition..<text.count]
        
        let diffDate = date.getDifference().getNumberText() //5 -> five
        
        return begin + diffDate + endText
    }
    
}
