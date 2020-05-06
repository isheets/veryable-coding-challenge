//
//  AccountCell.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/5/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

public class AccountCell: UITableViewCell {
    
    private let background = UIView()
    public let accountImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
    public let accountNameLabel = UILabel()
    public let accountDescLabel = UILabel()
    public let accountTypeLabel = UILabel()
    private let imageContainer = UIView()
    
    
    //configure custom cell
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        accountImage.translatesAutoresizingMaskIntoConstraints = false
        accountImage.contentMode = .scaleAspectFit
        accountImage.frame.size.height = 20
        accountImage.frame.size.width = 20
        
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
        let textStackView = UIStackView(arrangedSubviews: [accountNameLabel, accountDescLabel, accountTypeLabel])
        textStackView.axis = .vertical
        textStackView.distribution = .equalSpacing
        textStackView.alignment = .fill
        textStackView.spacing = 2
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //set background colors
        contentView.backgroundColor = UIColor.vryBackground()
        background.backgroundColor = UIColor.white
        
        //add shadow
        background.layer.shadowColor = UIColor.vryGrey().cgColor
        background.layer.shadowOpacity = 0.5
        background.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        background.layer.shadowRadius = 2
        background.layer.cornerRadius = 3
        
        //add to content view
        background.addSubview(accountImage)
        background.addSubview(textStackView)
        contentView.addSubview(background)
        
        //set constraints for background
        let cellMargins = contentView.layoutMarginsGuide
        background.leadingAnchor.constraint(equalTo: cellMargins.leadingAnchor, constant:  4).isActive = true
        background.trailingAnchor.constraint(equalTo: cellMargins.trailingAnchor, constant: -4).isActive = true
        background.topAnchor.constraint(equalTo: cellMargins.topAnchor, constant: -8).isActive = true
        background.bottomAnchor.constraint(equalTo: cellMargins.bottomAnchor).isActive = true
        
        //constraints for views
        let backgroundMargins = background.layoutMarginsGuide
        
        textStackView.leadingAnchor.constraint(equalTo: accountImage.trailingAnchor, constant: 12).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: backgroundMargins.trailingAnchor, constant: -8).isActive = true
        textStackView.topAnchor.constraint(equalTo: backgroundMargins.topAnchor, constant: 8).isActive = true
        textStackView.bottomAnchor.constraint(equalTo: backgroundMargins.bottomAnchor, constant: -8).isActive = true
        
        accountImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        accountImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        accountImage.leadingAnchor.constraint(equalTo: backgroundMargins.leadingAnchor, constant: 8).isActive = true
        accountImage.topAnchor.constraint(equalTo: backgroundMargins.topAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {

        // Configure the view for the selected state (animate shadow opacity)
        if selected {
            let animation = CABasicAnimation(keyPath: "shadowOpacity")
            animation.fromValue = background.layer.shadowOpacity
            animation.toValue = 0.0
            animation.duration = 0.1
            background.layer.add(animation, forKey: animation.keyPath)
            background.layer.shadowOpacity = 0.0
        } else {
            let animation = CABasicAnimation(keyPath: "shadowOpacity")
            animation.fromValue = background.layer.shadowOpacity
            animation.toValue = 0.5
            animation.duration = 0.1
            background.layer.add(animation, forKey: animation.keyPath)
            background.layer.shadowOpacity = 0.5
        }
        
    }
    
    func fillData(with: Account) {
        
    }

}
