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

}

class HistoryInteractor {

    // MARK: Properties
    weak var presenter: HistoryInteractorToPresenterProtocol!

}

// MARK: HistoryPresenterToInteractorProtocol
extension HistoryInteractor: HistoryPresenterToInteractorProtocol {
    
}