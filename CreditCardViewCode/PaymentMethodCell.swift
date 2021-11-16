//
//  PaymentMethodCell.swift
//  CreditCard
//
//  Created by Hellen on 06/10/21.
//

import UIKit
import SnapKit

class PaymentMethodCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
//        view.alpha = 1
        return view
    }()
    
    private lazy var iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(systemName: "creditcard")
        iconImage.contentMode = .scaleAspectFit
        iconImage.tintColor = .white
        return iconImage
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.contentMode = .left
        label.text = "Cartão de crédito"
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.contentMode = .left
        label.text = "**** 4852"
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "rectangle.and.pencil.and.ellipsis"), for: .normal)
        return button
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: PaymentMethodCell.self)
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setTitle(_ text: String) {
//        self.titleLabel.text = text
//    }
}

extension PaymentMethodCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(containerView)
        containerView.addSubview(iconImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(editButton)
    }
    
    func setupConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(70)
        }
        
        iconImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
//            make.top.equalToSuperview().offset(22)
//            make.bottom.equalToSuperview().inset(22)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(48)
          
        }
        
        subtitleLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(48)
            make.bottom.equalToSuperview().inset(16)
        }
        
        editButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(32)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(25)
        }
    }
    
    func setupComponents() {
        backgroundColor = UIColor(red: 8, green: 11, blue: 17, alpha: 0.8)
    }
}
