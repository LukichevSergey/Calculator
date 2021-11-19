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
    func viewDidLoad() {
    
    }
}

// MARK: CalculatorInteractorToPresenterProtocol
extension CalculatorPresenter: CalculatorInteractorToPresenterProtocol {
    
}