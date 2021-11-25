//
//  HistoryRouter.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import Foundation

// MARK: HistoryPresenterToRouterProtocol (Presenter -> Router)
protocol HistoryPresenterToRouterProtocol: AnyObject {
    func backToCalculatorViewController()
}

class HistoryRouter {

    // MARK: Properties
    weak var view: HistoryRouterToViewProtocol!
}

// MARK: HistoryPresenterToRouterProtocol
extension HistoryRouter: HistoryPresenterToRouterProtocol {
    func backToCalculatorViewController() {
        view.popView()
    }
}
