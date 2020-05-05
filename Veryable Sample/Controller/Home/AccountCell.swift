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
        
        //setup stackview for easier layout
        let textStackView = UIStackView(arrangedSubviews: [accountNameLabel, accountTypeLabel, accountDescLabel])
        textStackView.axis = .vertical
        textStackView.distribution = .equalSpacing
        textStackView.alignment = .fill
        textStackView.spacing = 8
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //set background colors
        contentView.backgroundColor = UIColor.vryBackground()
        background.backgroundColor = UIColor.white
        
        //add to content view
        background.addSubview(textStackView)
        contentView.addSubview(background)
        
        //set constraints
        let cellMargins = contentView.layoutMarginsGuide
        background.leadingAnchor.constraint(equalTo: cellMargins.leadingAnchor, constant: 4).isActive = true
        background.trailingAnchor.constraint(equalTo: cellMargins.trailingAnchor, constant: 4).isActive = true
        background.topAnchor.constraint(equalTo: cellMargins.topAnchor, constant: 8).isActive = true
        background.bottomAnchor.constraint(equalTo: cellMargins.bottomAnchor, constant: 0).isActive = true
        
        let backgroundMargins = background.layoutMarginsGuide
        textStackView.leadingAnchor.constraint(equalTo: backgroundMargins.leadingAnchor).isActive = true
        textStackView.trailingAnchor.constraint(equalTo: backgroundMargins.trailingAnchor).isActive = true
        textStackView.topAnchor.constraint(equalTo: backgroundMargins.topAnchor).isActive = true
        textStackView.bottomAnchor.constraint(equalTo: backgroundMargins.bottomAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(with: Account) {
        
    }

}
