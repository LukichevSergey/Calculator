//
//  CalculatorInteractor.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import Foundation

// MARK: CalculatorPresenterToInteractorProtocol (Presenter -> Interactor)
protocol CalculatorPresenterToInteractorProtocol: AnyObject {
    func returnValue(tag: String) -> String
}

class CalculatorInteractor {

    // MARK: Properties
    weak var presenter: CalculatorInteractorToPresenterProtocol!

}

// MARK: CalculatorPresenterToInteractorProtocol
extension CalculatorInteractor: CalculatorPresenterToInteractorProtocol {
    func returnValue(tag: String) -> String {
        CalculatorProperties.shared.clickButtonHandler(withTag: tag)
        let result: String = CalculatorProperties.shared.resultText
        return result
    }
}
