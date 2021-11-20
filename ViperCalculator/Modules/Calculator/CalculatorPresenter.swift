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
	func viewDidLoad()
    func clickToHistory()
    func clickToButton(withTag: String)
}

// MARK: CalculatorInteractorToPresenterProtocol (Interactor -> Presenter)
protocol CalculatorInteractorToPresenterProtocol: AnyObject {

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
        let newValue = interactor.returnValue(tag: tag)
        view.updateValue(value: newValue)
    }
    
    func clickToHistory() {
        router.presentHistoryViewController()
    }
    
    func viewDidLoad() {
    }
    
}

// MARK: CalculatorInteractorToPresenterProtocol
extension CalculatorPresenter: CalculatorInteractorToPresenterProtocol {
    
}
