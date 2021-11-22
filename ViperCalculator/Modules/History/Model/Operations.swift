//
//  Operations.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//

import Foundation
import UIKit
import CoreData

class Operations {
    
    static let shared = Operations()
    
    private(set) var operations: [Operation] = []
    
    func fetchData() -> [Operation]? {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Operation> = Operation.fetchRequest()
        do {
            operations = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return self.operations.count > 0 ? self.operations : nil
    }
    
    func saveOperation(firstNumber: Double, secondNumber: Double, sign: String, result: String) {
//        let operation = Data(firstNumber: firstNumber, secondNumber: secondNumber, sign: sign, result: result)
//        operations.append(operation)
        
        let context = getContext()
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Operation", in: context) else { return }
        
        let operation = Operation(entity: entity, insertInto: context)
        operation.firstNumber = firstNumber
        operation.secondNumber = secondNumber
        operation.sign = sign
        operation.result = result
        
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    func cleanOperations() {
        self.operations = []
    }
}
