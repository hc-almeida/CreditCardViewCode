//
//  CustomTextField.swift
//  CreditCardViewCode
//
//  Created by Hellen on 16/10/21.
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: Private Properties

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5)

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // MARK: - Private Functions

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor

        textColor = .label
        tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12

        backgroundColor = .tertiarySystemBackground
//        autocorrectionType = .no
//        returnKeyType = .go
//        clearButtonMode = .whileEditing
    }
}
