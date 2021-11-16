//
//  ViewController.swift
//  CreditCardViewCode
//
//  Created by Hellen on 16/10/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - View Lifecycle

    // MARK: - Private Properties

    private lazy var paymentMethodView: PaymentMethodView = {
        return PaymentMethodView(self)
    }()
    
    override func loadView() {
        self.view = paymentMethodView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: PaymentMethodViewDelegate {
    
    func didSelectedAddCard() {
        let creditCardViewController = CreditViewController()
        
        navigationController?.pushViewController(creditCardViewController, animated: true)
    }
}
