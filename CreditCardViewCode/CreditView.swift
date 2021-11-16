//
//  CreditView.swift
//  CreditCardViewCode
//
//  Created by Hellen on 16/10/21.
//

import Foundation
import UIKit

class CreditView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var scrollContent: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var cardNumberField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Número do cartão"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func creditCardNumberDidChange(_ textField: UITextField) {
        print("funciona caralho")
        guard let creditCardNumber = textField.text else {
            print("caralho")
            return
            
        }
       
    }
}

extension CreditView: ViewCodeProtocol {
    func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        scrollContent.addSubview(cardNumberField)
    }
    
    func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.left.right.equalTo(safeAreaLayoutGuide)
            make.top.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        scrollContent.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        cardNumberField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
    }
    
    func setupComponents() {
        backgroundColor = .white
        cardNumberField.addTarget(self, action: #selector(creditCardNumberDidChange), for: .allEvents)
    }
    
}
