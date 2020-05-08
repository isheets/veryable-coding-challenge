//
//  AccountCellView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

class AccountCellView: UITableViewCell {
    
    private let background = UIView()
    private let textStackView = UIStackView()
    private let accountImageView = UIImageView()
    private let accountNameLabel = UILabel()
    private let accountDescLabel = UILabel()
    private let accountTypeLabel = UILabel()
    
    private let arrowImage = UIImage(named: "arrow")?.withTintColor(UIColor.vryGrey())
    private lazy var arrowImageView = UIImageView(image: arrowImage)
    
    //configure custom cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.contentMode = .scaleAspectFit
        accountImageView.translatesAutoresizingMaskIntoConstraints = false
        accountImageView.contentMode = .scaleAspectFit
        
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNameLabel.font = UIFont.vryAvenirNextDemiBold(14)
        accountNameLabel.textColor = UIColor.vryGreyDark()
        
        accountDescLabel.translatesAutoresizingMaskIntoConstraints = false
        accountDescLabel.font = UIFont.vryAvenirNextRegular(12)
        accountDescLabel.textColor = UIColor.vryGreyDark()
        
        accountTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        accountTypeLabel.font = UIFont.vryAvenirNextRegular(12)
        accountTypeLabel.textColor = UIColor.vryGrey()
        
        //setup stackviews for easier layout
        textStackView.addArrangedSubview(accountNameLabel)
        textStackView.addArrangedSubview(accountDescLabel)
        textStackView.addArrangedSubview(accountTypeLabel)
        textStackView.axis = .vertical
        textStackView.distribution = .equalSpacing
        textStackView.alignment = .fill
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //set background colors
        contentView.backgroundColor = UIColor.vryBackground()
        background.backgroundColor = UIColor.white
        
        //add shadow
        background.layer.shadowColor = UIColor.vryGrey().cgColor
        background.layer.shadowOpacity = 0.6
        background.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        background.layer.shadowRadius = 2
        background.layer.cornerRadius = 3
        
        //add to content view
        background.addSubview(accountImageView)
        background.addSubview(textStackView)
        background.addSubview(arrowImageView)

        contentView.addSubview(background)
        
        constrainViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //selection state
    private let selectAnimation = CABasicAnimation(keyPath: "shadowRadius")
    public override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected state (animate shadow radius)
        if selected {
            selectAnimation.fromValue = background.layer.shadowRadius
            selectAnimation.toValue = 1
            selectAnimation.duration = 0.1
            background.layer.add(selectAnimation, forKey: selectAnimation.keyPath)
            background.layer.shadowRadius = 0
        } else {
            selectAnimation.fromValue = background.layer.shadowRadius
            selectAnimation.toValue = 2
            selectAnimation.duration = 0.1
            background.layer.add(selectAnimation, forKey: selectAnimation.keyPath)
            background.layer.shadowRadius = 2
        }
    }
    
    //handles auto layout for all the views in the cell
    func constrainViews() {
        //set constraints for background
        let cellMargins = contentView.layoutMarginsGuide
        background.leadingAnchor.constraint(equalTo: cellMargins.leadingAnchor, constant:  4).isActive = true
        background.trailingAnchor.constraint(equalTo: cellMargins.trailingAnchor, constant: -4).isActive = true
        background.topAnchor.constraint(equalTo: cellMargins.topAnchor, constant: -8).isActive = true
        background.bottomAnchor.constraint(equalTo: cellMargins.bottomAnchor).isActive = true
        
        //constraints for views
        let backgroundMargins = background.layoutMarginsGuide
        
        textStackView.leadingAnchor.constraint(equalTo: accountImageView.trailingAnchor, constant: 12).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8).isActive = true
        textStackView.topAnchor.constraint(equalTo: backgroundMargins.topAnchor, constant: 8).isActive = true
        textStackView.bottomAnchor.constraint(equalTo: backgroundMargins.bottomAnchor, constant: -8).isActive = true
        
        accountImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        accountImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        accountImageView.leadingAnchor.constraint(equalTo: backgroundMargins.leadingAnchor, constant: 8).isActive = true
        accountImageView.topAnchor.constraint(equalTo: backgroundMargins.topAnchor, constant: 10).isActive = true
        
        arrowImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        arrowImageView.trailingAnchor.constraint(equalTo: backgroundMargins.trailingAnchor).isActive = true
        arrowImageView.centerYAnchor.constraint(equalTo: backgroundMargins.centerYAnchor).isActive = true
    }
    
    //set the content for the cell's data views given an Account
    func fillData(account: Account) {
        accountNameLabel.text = account.account_name
        accountDescLabel.text = account.desc
        accountImageView.image = account.image
        accountTypeLabel.text = account.account_type
    }

}
