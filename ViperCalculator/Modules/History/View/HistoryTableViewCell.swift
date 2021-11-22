//
//  HistoryTableViewCell.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    lazy var firstNumber: UILabel = createLabel()
    lazy var secondNumber: UILabel = createLabel()
    lazy var sign: UILabel = createLabel()
    lazy var value: UILabel = createLabel()
    lazy var equals: UILabel = createLabel()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstNumber, sign, secondNumber, equals, value])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        return stack
    }()
    
    static let reuseIdentifier = "cell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.bottom.left.right.equalTo(self).inset(5)
        }
    }
    
    func configure(withItemModel model: Operation) {
        self.backgroundColor = .black
        self.sign.text = model.sign
        self.value.text = model.result
        self.firstNumber.text = "\(model.firstNumber)".textFormatting
        self.secondNumber.text = "\(model.secondNumber)".textFormatting
        self.equals.text = "="
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }

}
