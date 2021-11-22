//
//  HistoryInteractor.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import Foundation

// MARK: HistoryPresenterToInteractorProtocol (Presenter -> Interactor)
protocol HistoryPresenterToInteractorProtocol: AnyObject {
    var data: [Operation] { get }
    func cleanHistory()
}

class HistoryInteractor {

}

// MARK: HistoryPresenterToInteractorProtocol
extension HistoryInteractor: HistoryPresenterToInteractorProtocol {
    var data: [Operation] {
        var data: [Operation] = []
        if let historyData = Operations.shared.fetchData() {
            data = historyData
        }
        return data
    }
    
    func cleanHistory() {
        Operations.shared.cleanOperations()
    }
}
