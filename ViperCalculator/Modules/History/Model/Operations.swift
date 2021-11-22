//
//  Operations.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//

import Foundation

class Operations {
    
    static let shared = Operations()
    
    private(set) var operations: [Data] = []
    
    func fetchData() -> [Data]? {
        return self.operations.count > 0 ? self.operations : nil
    }
    
    func saveOperation(firstNumber: Double, secondNumber: Double, sign: String, result: String) {
        let operation = Data(firstNumber: firstNumber, secondNumber: secondNumber, sign: sign, result: result)
        operations.append(operation)
    }
}
