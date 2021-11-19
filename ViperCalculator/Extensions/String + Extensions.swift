//
//  String + Extensions.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//

import Foundation

private let formatter = NumberFormatter()

extension String {
    var textFormatting: String {
        return self.roundingNumber.removeLastZero.replacingADotWithAComma
    }
    
    private var roundingNumber: String {
        return String(round(1000*Double(self)!) / 1000)
    }
    
    private var removeLastZero: String {
        let splitValue = self.split(separator: ".")
        if splitValue.count > 1 && splitValue[1] == "0" {
            return String(splitValue[0])
        } else {
            return self
        }
    }
    
    private var replacingADotWithAComma: String {
        return self.replacingOccurrences(of: ".", with: ",")
    }
}
