//
//  CalculatorRouter.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import Foundation

// MARK: CalculatorPresenterToRouterProtocol (Presenter -> Router)
protocol CalculatorPresenterToRouterProtocol: AnyObject {
    func navigateToHistory()
}

class CalculatorRouter {

    // MARK: Properties
    weak var view: CalculatorRouterToViewProtocol!
}

// MARK: CalculatorPresenterToRouterProtocol
extension CalculatorRouter: CalculatorPresenterToRouterProtocol {
    func navigateToHistory() {
        view.pushView(view: HistoryConfigurator().configure())
    }
}
