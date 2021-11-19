//
//  HistoryViewController.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//  
//

import UIKit

// MARK: HistoryPresenterToViewProtocol (Presenter -> View)
protocol HistoryPresenterToViewProtocol: AnyObject {

}

// MARK: HistoryRouterToViewProtocol (Router -> View)
protocol HistoryRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class HistoryViewController: UIViewController {
    
    // MARK: - Property
    var presenter: HistoryViewToPresenterProtocol!

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

// MARK: HistoryPresenterToViewProtocol 
extension HistoryViewController: HistoryPresenterToViewProtocol{
    
}

// MARK: HistoryRouterToViewProtocol
extension HistoryViewController: HistoryRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}