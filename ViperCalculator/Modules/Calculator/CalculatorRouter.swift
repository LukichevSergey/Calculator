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
    func presentHistoryViewController()
}

class CalculatorRouter {

    // MARK: Properties
    weak var view: CalculatorRouterToViewProtocol!
    

}

// MARK: CalculatorPresenterToRouterProtocol
extension CalculatorRouter: CalculatorPresenterToRouterProtocol {
    func presentHistoryViewController() {
        let historyConfigurator = HistoryConfigurator()
        view.pushView(view: historyConfigurator.configure())
    }
}
