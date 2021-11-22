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
    var data: [Data] { get }
    func cleanHistory()
}

class HistoryInteractor {

}

// MARK: HistoryPresenterToInteractorProtocol
extension HistoryInteractor: HistoryPresenterToInteractorProtocol {
    var data: [Data] {
        var data: [Data] = []
        if let historyData = Operations.shared.fetchData() {
            data = historyData
        }
        return data
    }
    
    func cleanHistory() {
        Operations.shared.cleanOperations()
    }
}
