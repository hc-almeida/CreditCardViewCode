//
//  CreditViewController.swift
//  CreditCardViewCode
//
//  Created by Hellen on 16/10/21.
//

import UIKit

class CreditViewController: UIViewController, CreditCardViewDelegate {
    
    // MARK: - Private Properties

    private lazy var creditCardView: CreditCardView = {
        return CreditCardView(self)
    }()
    
    override func loadView() {
        self.view = creditCardView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   
    }
    
    func creditCardNumberDidChange(_ creditCardNumber: String) {
        print(creditCardNumber)
    }
    
    func didSelectButton() {
        print("select button")
    }
    
}

