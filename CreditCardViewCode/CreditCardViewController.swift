//
//  CreditCardViewController.swift
//  CreditCardViewCode
//
//  Created by Hellen on 16/10/21.
//

import UIKit

class CreditCardViewController: UIViewController {
    
    // MARK: - Private Properties

    private lazy var creditCardView: CreditCardView = {
        return CreditCardView(self)
    }()
    
    override func loadView() {
        self.view = creditCardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupKeyboardHideBehavior()
    }
    
    func setupKeyboardHideBehavior() {
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard))

        self.view.addGestureRecognizer(gesture)
    }

    @objc
    func hideKeyboard() {
        self.view.endEditing(true)
    }
}

extension CreditCardViewController: CreditCardViewDelegate, UITextFieldDelegate {
    
    func didSelectButton() {
        dismiss(animated: true, completion: nil)
    }
    
    
    func creditCardNumberDidChange(_ creditCardNumber: String) {
        print("test \(creditCardNumber)")
//        creditCardView.setupUI(creditCardNumber)
    }
}
