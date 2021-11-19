//
//  HistoryPresenter.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import Foundation

// MARK: HistoryViewToPresenterProtocol (View -> Presenter)
protocol HistoryViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: HistoryInteractorToPresenterProtocol (Interactor -> Presenter)
protocol HistoryInteractorToPresenterProtocol: AnyObject {

}

class HistoryPresenter {

    // MARK: Properties
    var router: HistoryPresenterToRouterProtocol!
    var interactor: HistoryPresenterToInteractorProtocol!
    weak var view: HistoryPresenterToViewProtocol!
}

// MARK: HistoryViewToPresenterProtocol
extension HistoryPresenter: HistoryViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: HistoryInteractorToPresenterProtocol
extension HistoryPresenter: HistoryInteractorToPresenterProtocol {
    
}