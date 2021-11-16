//
//  CreditCardView.swift
//  CreditCardViewCode
//
//  Created by Hellen on 16/10/21.
//

import UIKit

protocol CreditCardViewDelegate: AnyObject {
    
    func creditCardNumberDidChange(_ creditCardNumber: String)
    
    func didSelectButton()
}

class CreditCardView: UIView {
    
    // MARK: - UI Components
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView(frame: .zero)
    }()
    
    private lazy var scrollContent: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var frontCreditCardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var backCreditCardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var cardNumberField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Número do cartão"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private lazy var expirationDateField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Validade"
        textField.keyboardType = .numberPad
        return textField
    }()

    private lazy var securityCodeField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "CVV"
        textField.keyboardType = .numberPad
        return textField
    }()
    
//    private lazy var tapGesture: UITapGestureRecognizer = {
//        let tapGesture = UITapGestureRecognizer()
//        tapGesture.addTarget(self, action: #selector(flip))
//        tapGesture.numberOfTapsRequired = 1
//        return tapGesture
//    }()
    
    private lazy var questionButton: UIButton = {
        let button = UIButton()
        button.tintColor = .systemGray
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        return button
    }()

    private lazy var cardHolderNameField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Nome do titular"
        textField.keyboardType = .default
        return textField
    }()

    private lazy var cpfCardHolderField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "CPF / CNPJ do titular"
        textField.keyboardType = .default
        return textField
    }()

    private lazy var cardNameField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Apelido do cartão (opcional)"
        textField.keyboardType = .default
        return textField
    }()
    
    private lazy var cardSaveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont(name: "Body", size: 14)
        button.setTitle("Salvar", for: .normal)
        return button
    }()
    
    private var showingBack = false
    
    weak var delegate: CreditCardViewDelegate?
    
    // MARK: - Public Functions
    
    func setupUI(_ viewModel: String) {
//        cardNumberField.text = viewModel
//        expirationDateField.text = viewModel
//        securityCodeField.text = viewModel
//        cardHolderNameField.text = viewModel
//        cpfCardHolderField.text = viewModel
//        cardNameField.text = viewModel
    }
    
    enum CreditCardTextField: Int {
        case cardNumber = 1
        case expirationDate = 2
        case securityCode = 3
        case cardHolder = 4
        case cpfNumber = 5
        case cardName = 6
    }
    
    // MARK: - Inits
    
    init(_ delegate: CreditCardViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Functions
    
    func isEnableButton(_ isEnable: Bool) {
        cardSaveButton.isEnabled = false
        cardSaveButton.backgroundColor = .systemGray5
        cardSaveButton.tintColor = .systemGray
        cardSaveButton.layer.borderColor = UIColor.systemGray.cgColor
    }
    
    // MARK: - Private Functions
    
//    @objc
    @objc func flip() {
//        securityCodeField.resignFirstResponder()
        let toView = showingBack ? frontCreditCardImage : backCreditCardImage
        let fromView = showingBack ? backCreditCardImage : frontCreditCardImage
        UIView.transition(from: fromView, to: toView, duration: 0.8,
                          options: .transitionFlipFromRight, completion: nil)
        toView.translatesAutoresizingMaskIntoConstraints = false
        
        toView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        showingBack = !showingBack
    }
    
    @objc
    private func creditCardNumberDidChange(_ textField: UITextField) {
        print("funciona caralho")
        guard let creditCardNumber = textField.text else {
            print("caralho")
            return
            
        }
        delegate?.creditCardNumberDidChange(creditCardNumber)
    }
    
    @objc
    private func expirationDateDidChange(_ textField: UITextField) {
        guard let expirationDate = textField.text else { return }
//        delegate.expirationDateDidChange(expirationDate)
    }
    
    @objc
    private func securityCodeDidChange(_ textField: UITextField) {
//        if textField.isSelected {
            flip()
//        }
        print(textField)
        
        guard let securityCode = textField.text else { return }
        //        delegate.securityCodeDidChange(securityCode)
    }
    
    @objc
    private func securityCodeTouchDown(_ textField: UITextField) {
        guard let securityCode = textField.text else { return }
        //        delegate.securityCodeDidChange(securityCode)
    }
    
    @objc
    private func didSelectQuestionButton() {
//        delegate.didSelectPurchaseButton()
    }
    
    @objc
    private func holderNameDidChange(_ textField: UITextField) {
        guard let holderName = textField.text else { return }
//        delegate.holderNameDidChange(holderName)
    }
    
    @objc
    private func cpfDidChange(_ textField: UITextField) {
        guard let cpf = textField.text else { return }
//        delegate.cpfDidChange(cpf)
    }
    
    @objc
    private func cardNameFieldDidChange(_ textField: UITextField) {
        guard let name = textField.text else { return }
//        delegate.cpfDidChange(cpf)
    }
    
    @objc
    private func didSelectCardSaveButton() {
        delegate?.didSelectButton()
    }
    
    private func setup(textField: CustomTextField, withTag viewTag: CreditCardTextField) {
        textField.tag = viewTag.rawValue
    }
}

extension CreditCardView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContent)
        scrollContent.addSubview(cardView)
        cardView.addSubview(frontCreditCardImage)
        scrollContent.addSubview(cardNumberField)
        scrollContent.addSubview(expirationDateField)
        scrollContent.addSubview(securityCodeField)
        securityCodeField.addSubview(questionButton)
//        securityCodeField.addGestureRecognizer(tapGesture)
        scrollContent.addSubview(cardHolderNameField)
        scrollContent.addSubview(cpfCardHolderField)
        scrollContent.addSubview(cardNameField)
        scrollContent.addSubview(cardSaveButton)
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
        
        cardView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        
        frontCreditCardImage.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        cardNumberField.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        expirationDateField.snp.makeConstraints { make in
            make.top.equalTo(cardNumberField.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(48)
        }

        securityCodeField.snp.makeConstraints { make in
            make.top.equalTo(cardNumberField.snp.bottom).offset(32)
            make.left.equalTo(expirationDateField.snp.right).offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
            make.width.equalTo(150)
        }

        questionButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }

        cardHolderNameField.snp.makeConstraints { make in
            make.top.equalTo(securityCodeField.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        cpfCardHolderField.snp.makeConstraints { make in
            make.top.equalTo(cardHolderNameField.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }

        cardNameField.snp.makeConstraints { make in
            make.top.equalTo(cpfCardHolderField.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        cardSaveButton.snp.makeConstraints { make in
//            make.top.equalTo(cardNameField.snp.bottom).offset(100)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.lessThanOrEqualTo(safeAreaLayoutGuide).inset(24)
            make.height.equalTo(48)
        }
    }
    
    func setupComponents() {
        backgroundColor = UIColor(red: 8, green: 11, blue: 17, alpha: 0.8)
        
//        setup(textField: cardNumberField, withTag: .cardNumber)
//        setup(textField: expirationDateField, withTag: .expirationDate)
//        setup(textField: securityCodeField, withTag: .securityCode)
//        setup(textField: cardHolderNameField, withTag: .cardHolder)
//        setup(textField: cpfCardHolderField, withTag: .cpfNumber)
//        setup(textField: cardNameField, withTag: .cardName)
        
        cardNumberField.accessibilityIdentifier = "cardNumberTextFieldId"
//        expirationDateField.accessibilityIdentifier = "expirationTextFieldId"
//        securityCodeField.accessibilityIdentifier = "securityCodeTextFieldId"
//        cardHolderNameField.accessibilityIdentifier = "cardholderNameTextFieldId"
//        cpfCardHolderField.accessibilityIdentifier = "documentTextFieldId"
//        cardNameField.accessibilityIdentifier = "nameTextFieldId"
        cardSaveButton.accessibilityIdentifier = "saveCardId"
        
        cardNumberField.addTarget(self, action: #selector(creditCardNumberDidChange), for: .allEvents)
        expirationDateField.addTarget(self, action: #selector(expirationDateDidChange), for: .allEvents)
        securityCodeField.addTarget(self, action: #selector(securityCodeDidChange), for: .allEvents)
        securityCodeField.addTarget(self, action: #selector(securityCodeTouchDown), for: .touchDown)
        questionButton.addTarget(self, action:  #selector(didSelectQuestionButton), for: .touchUpInside)
        cardHolderNameField.addTarget(self, action: #selector(holderNameDidChange), for: .allEvents)
        cpfCardHolderField.addTarget(self, action: #selector(cpfDidChange), for: .allEvents)
        cardNameField.addTarget(self, action: #selector(cardNameFieldDidChange), for: .allEvents)
        cardSaveButton.addTarget(self, action: #selector(didSelectCardSaveButton), for: .touchUpInside)
    }
}
