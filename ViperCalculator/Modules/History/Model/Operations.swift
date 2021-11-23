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
    
    private lazy var context = (UIApplication.shared.delegate as! AppDelegate).coreDataManager.persistentContainer.viewContext
    
    func fetchData() -> [Operation]? {
        let fetchRequest: NSFetchRequest<Operation> = Operation.fetchRequest()
        do {
            operations = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return self.operations.count > 0 ? self.operations : nil
    }
    
    func saveOperation(firstNumber: Double, secondNumber: Double, sign: String, result: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Operation", in: context) else { return }
        
        let operation = Operation(entity: entity, insertInto: context)
        operation.firstNumber = firstNumber
        operation.secondNumber = secondNumber
        operation.sign = sign
        operation.result = result
        
        saveContext()
    }
    
    func cleanOperations() {
        let fetchRequest: NSFetchRequest<Operation> = Operation.fetchRequest()
        if let items = try? context.fetch(fetchRequest) {
            for item in items {
                context.delete(item)
            }
        }
        
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
