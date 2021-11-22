//
//  CalculatorConfigurator.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import UIKit

class CalculatorConfigurator {
    func configure() -> UIViewController {
        let view = CalculatorViewController()
        let presenter = CalculatorPresenter()
        let router = CalculatorRouter()
        let interactor = CalculatorInteractor()
        
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
