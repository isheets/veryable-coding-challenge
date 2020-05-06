//
//  AccountDetailViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/6/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

class AccountDetailViewController: BaseViewController {
    
    var curAccount: Account?
    
    private let accountImageView = UIImageView()
    private let accountNameLabel = UILabel()
    private let accountDescLabel = UILabel()
    private let doneButton = UIButton()
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "DETAILS"
    }
    
    override func addSubviews() {
        super.addSubviews()
        if let account = curAccount {
            
            accountNameLabel.text = account.account_name
            accountNameLabel.font = UIFont.vryAvenirNextDemiBold(16)
            accountNameLabel.textColor = UIColor.vryGreyDark()
            
            accountDescLabel.text = account.desc
            accountDescLabel.font = UIFont.vryAvenirNextRegular(14)
            accountDescLabel.textColor = UIColor.vryGrey()
            
            accountImageView.image = account.image.withTintColor(UIColor.vryBlue())
            accountImageView.contentMode = .scaleAspectFit
            
            accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
            accountDescLabel.translatesAutoresizingMaskIntoConstraints = false
            accountImageView.translatesAutoresizingMaskIntoConstraints = false
            
            stackView.addArrangedSubview(accountNameLabel)
            stackView.addArrangedSubview(accountDescLabel)
            
            stackView.axis = .vertical
            stackView.distribution = .equalSpacing
            stackView.alignment = .center
            stackView.spacing = 4
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(accountImageView)
            self.view.addSubview(stackView)
        }
    }
    
    override func makeConstraints() {
        let viewMargins = self.view.layoutMarginsGuide
        
        accountImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        accountImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        accountImageView.topAnchor.constraint(equalTo: viewMargins.topAnchor, constant: 16).isActive = true
        accountImageView.centerXAnchor.constraint(equalTo: viewMargins.centerXAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: accountImageView.bottomAnchor, constant: 16).isActive = true
        stackView.centerXAnchor.constraint(equalTo: viewMargins.centerXAnchor).isActive = true
        
    }

}
