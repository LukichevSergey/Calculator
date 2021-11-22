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
    func updateTable(with data: [Data])
}

// MARK: HistoryRouterToViewProtocol (Router -> View)
protocol HistoryRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
    func popView()
}

class HistoryViewController: UIViewController {
    
    // MARK: - Property
    var presenter: HistoryViewToPresenterProtocol!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.reuseIdentifier)
        tableView.rowHeight          = 100
        tableView.estimatedRowHeight = 150
        tableView.delegate           = self
        tableView.backgroundColor    = .black
        tableView.separatorColor     = .white
        return tableView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Назад", for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    private lazy var cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить историю", for: .normal)
        button.addTarget(self, action: #selector(cleanHistory), for: .touchUpInside)
        return button
    }()
    
    private lazy var dataSource = UITableViewDiffableDataSource<Section, Data>(tableView: tableView) { tableView, indexPath, item in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.reuseIdentifier, for: indexPath) as? HistoryTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: nil)
        }

        cell.configure(withItemModel: item)
        return cell
    }

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
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        
        self.view.addSubview(cleanButton)
        cleanButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalTo(view.safeAreaLayoutGuide).inset(15)
        }

        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(backButton.snp.bottom)
        }
    }
    
    @objc private func goBack() {
        presenter.clickGoBack()
    }
    
    @objc private func cleanHistory() {
        presenter.clickCleanHistory()
    }
}

// MARK: HistoryPresenterToViewProtocol 
extension HistoryViewController: HistoryPresenterToViewProtocol{
    func updateTable(with data: [Data]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Data>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(data)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
}

// MARK: HistoryRouterToViewProtocol
extension HistoryViewController: HistoryRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
    
    func popView() {
        navigationController?.popViewController(animated: true)
    }
}

extension HistoryViewController: UITableViewDelegate {

}
