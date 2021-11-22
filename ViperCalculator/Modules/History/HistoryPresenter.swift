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
    func clickGoBack()
    func clickCleanHistory()
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
        updateTable()
    }
    
    func clickGoBack(){
        router.presentCalculatorViewController()
    }
    
    func clickCleanHistory() {
        interactor.cleanHistory()
        updateTable()
    }
    
    private func updateTable() {
        DispatchQueue.main.async {
            self.view.updateTable(with: self.interactor.data)
        }
    }
}
