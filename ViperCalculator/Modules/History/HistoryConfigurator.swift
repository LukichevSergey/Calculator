//
//  HistoryConfigurator.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import UIKit

class HistoryConfigurator {
    func configure() -> UIViewController {
        let view = HistoryViewController()
        let presenter = HistoryPresenter()
        let router = HistoryRouter()
        let interactor = HistoryInteractor()
        
        view.presenter = presenter
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}