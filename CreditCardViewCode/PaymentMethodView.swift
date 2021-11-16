//
//  PaymentMethodView.swift
//  CreditCard
//
//  Created by Hellen on 06/10/21.
//

import UIKit

protocol PaymentMethodViewDelegate: AnyObject {
    func didSelectedAddCard()
}

class PaymentMethodView: UIView {
    
    // MARK: - UI Components
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 8, green: 11, blue: 17, alpha: 0.8)
//        view.alpha = 1
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Adiconar novo cartão", for: .normal)
        button.titleLabel?.font = UIFont(name: "Boy", size: 14)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    weak var delegate: PaymentMethodViewDelegate?
    
    // MARK: - Inits
    
    init(_ delegate: PaymentMethodViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func didSelectedButton() {
        delegate?.didSelectedAddCard()
    }
}

extension PaymentMethodView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(tableView)
        addSubview(button)
    }
    
    func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.right.equalTo(safeAreaLayoutGuide)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(48)
        }
    }
    
    func setupComponents() {
        backgroundColor = UIColor(red: 8, green: 11, blue: 17, alpha: 0.8)
        button.layer.cornerRadius = 8
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.accessibilityIdentifier = "tableViewMenu"
        PaymentMethodCell.registerCellOn(tableView)
        button.addTarget(self, action: #selector(didSelectedButton), for: .touchUpInside)
    }
}

extension PaymentMethodView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = PaymentMethodCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
                as? PaymentMethodCell else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension UITableViewCell {
    
    static func registerOn(_ tableView: UITableView) {
        let reuseIdentifier = String(describing: self.self)
        let nib = UINib(nibName: reuseIdentifier, bundle: Bundle(for: self.self))
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    static func registerCellOn(_ tableView: UITableView) {
        let reuseIdentifier = String(describing: self.self)
        tableView.register(self.self, forCellReuseIdentifier:  reuseIdentifier)
    }
}
