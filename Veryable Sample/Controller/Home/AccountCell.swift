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
    public let accountImage = UIImageView()
    public let accountNameLabel = UILabel()
    public let accountDescLabel = UILabel()
    public let accountTypeLabel = UILabel()
    
    
    //configure custom cell
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //set to false in order to use auto layout
        background.translatesAutoresizingMaskIntoConstraints = false
        accountImage.translatesAutoresizingMaskIntoConstraints = false
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountDescLabel.translatesAutoresizingMaskIntoConstraints = false
        accountTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //RESIZE image here
        //accountImage.frame = CGSize(width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        accountImage.contentMode = .scaleAspectFit
        
        //setup stackviews for easier layout
        let textStackView = UIStackView(arrangedSubviews: [accountNameLabel, accountTypeLabel, accountDescLabel])
        textStackView.axis = .vertical
        textStackView.distribution = .equalSpacing
        textStackView.alignment = .fill
        textStackView.spacing = 4
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutStackView = UIStackView(arrangedSubviews: [accountImage, textStackView])
        layoutStackView.axis = .horizontal
        layoutStackView.distribution = .equalSpacing
        layoutStackView.alignment = .fill
        layoutStackView.spacing = 8
        layoutStackView.translatesAutoresizingMaskIntoConstraints = false
        
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
        background.addSubview(layoutStackView)
        contentView.addSubview(background)
        
        //set constraints
        let cellMargins = contentView.layoutMarginsGuide
        background.leadingAnchor.constraint(equalTo: cellMargins.leadingAnchor, constant: 4).isActive = true
        background.trailingAnchor.constraint(equalTo: cellMargins.trailingAnchor, constant: -4).isActive = true
        background.topAnchor.constraint(equalTo: cellMargins.topAnchor, constant: 4).isActive = true
        background.bottomAnchor.constraint(equalTo: cellMargins.bottomAnchor).isActive = true
        
        let backgroundMargins = background.layoutMarginsGuide
        layoutStackView.leadingAnchor.constraint(equalTo: backgroundMargins.leadingAnchor, constant: 4).isActive = true
        layoutStackView.trailingAnchor.constraint(equalTo: backgroundMargins.trailingAnchor, constant: -4).isActive = true
        layoutStackView.topAnchor.constraint(equalTo: backgroundMargins.topAnchor, constant: 8).isActive = true
        layoutStackView.bottomAnchor.constraint(equalTo: backgroundMargins.bottomAnchor, constant: -8).isActive = true
        
        
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
