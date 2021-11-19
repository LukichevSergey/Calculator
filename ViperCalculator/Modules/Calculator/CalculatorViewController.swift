//
//  CalculatorViewController.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import UIKit

// MARK: CalculatorPresenterToViewProtocol (Presenter -> View)
protocol CalculatorPresenterToViewProtocol: AnyObject {

}

// MARK: CalculatorRouterToViewProtocol (Router -> View)
protocol CalculatorRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class CalculatorViewController: UIViewController {
    
    // MARK: - Property
    var presenter: CalculatorViewToPresenterProtocol!

    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)

        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - private func
    private func commonInit() {

    }

    private func configureUI() {

    }
}

// MARK: CalculatorPresenterToViewProtocol 
extension CalculatorViewController: CalculatorPresenterToViewProtocol{
    
}

// MARK: CalculatorRouterToViewProtocol
extension CalculatorViewController: CalculatorRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}