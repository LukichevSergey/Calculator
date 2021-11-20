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
    func fetchData() -> [Data]
}

class HistoryInteractor {

    // MARK: Properties
    weak var presenter: HistoryInteractorToPresenterProtocol!

}

// MARK: HistoryPresenterToInteractorProtocol
extension HistoryInteractor: HistoryPresenterToInteractorProtocol {
    func fetchData() -> [Data] {
        var data: [Data] = []
        data = Operations.shared.fetchData()
        return data
    }
}
