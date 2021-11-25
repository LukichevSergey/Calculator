//
//  CalculatorPresenter.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import Foundation

// MARK: CalculatorViewToPresenterProtocol (View -> Presenter)
protocol CalculatorViewToPresenterProtocol: AnyObject {
    func clickToHistory()
    func clickToButton(withTag: String)
}

class CalculatorPresenter {

    // MARK: Properties
    var router: CalculatorPresenterToRouterProtocol!
    var interactor: CalculatorPresenterToInteractorProtocol!
    weak var view: CalculatorPresenterToViewProtocol!
    
}

// MARK: CalculatorViewToPresenterProtocol
extension CalculatorPresenter: CalculatorViewToPresenterProtocol {
    
    func clickToButton(withTag tag: String) {
        view.updateValue(value: interactor.returnValue(tag: tag))
    }
    
    func clickToHistory() {
        router.navigateToHistory()
    }
}
