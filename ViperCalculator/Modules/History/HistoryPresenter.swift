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
    func clickGoBack(){
        router.presentCalculatorViewController()
    }
}

// MARK: HistoryInteractorToPresenterProtocol
extension HistoryPresenter: HistoryInteractorToPresenterProtocol {
    
}
