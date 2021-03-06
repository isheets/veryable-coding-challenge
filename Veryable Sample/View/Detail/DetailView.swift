//
//  DetailView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let descLabel = UILabel()
    let doneButton = UIButton(type: UIButton.ButtonType.custom)
    private let stackView = UIStackView()
    
    private var setupConstraints = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel.font = UIFont.vryAvenirNextDemiBold(16)
        nameLabel.textColor = UIColor.vryGreyDark()
        
        descLabel.font = UIFont.vryAvenirNextRegular(14)
        descLabel.textColor = UIColor.vryGrey()
        
        imageView.contentMode = .scaleAspectFit
        imageView.tag = 99
        
        doneButton.setTitle("DONE", for: .normal)
        doneButton.titleLabel?.textColor = UIColor.white
        doneButton.titleLabel?.font = UIFont.vryAvenirNextMedium(14)
        doneButton.backgroundColor = UIColor.vryBlue()
        doneButton.layer.shadowOpacity = 0.6
        doneButton.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        doneButton.layer.shadowRadius = 2
        doneButton.layer.cornerRadius = 2
        doneButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 0,bottom: 12, right: 0)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descLabel)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imageView)
        self.addSubview(stackView)
        self.addSubview(doneButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(setupConstraints) {
            let viewMargins = self.layoutMarginsGuide
            
            imageView.snp.makeConstraints{(make) in
                make.size.equalTo(80)
                make.top.equalTo(viewMargins.snp.top).offset(16)
                make.centerX.equalTo(self.snp.centerX)
            }
            
            stackView.snp.makeConstraints{(make) in
                make.top.equalTo(imageView.snp.bottom).offset(16)
                make.centerX.equalTo(self.snp.centerX)
            }
            
            doneButton.snp.makeConstraints{(make) in
                make.bottom.equalTo(viewMargins.snp.bottom).offset(-8)
                make.leading.equalTo(viewMargins.snp.leading).offset(8)
                make.trailing.equalTo(viewMargins.snp.trailing).offset(-8)
            }
            setupConstraints = false
        }

        super.updateConstraints()
    }
    
}
