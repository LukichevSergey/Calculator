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

}

class CalculatorInteractor {

    // MARK: Properties
    weak var presenter: CalculatorInteractorToPresenterProtocol!

}

// MARK: CalculatorPresenterToInteractorProtocol
extension CalculatorInteractor: CalculatorPresenterToInteractorProtocol {
    
}