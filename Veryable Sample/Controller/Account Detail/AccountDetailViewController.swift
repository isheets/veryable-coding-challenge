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
    
    var accountDetailView: DetailView!

    override func viewDidLoad() {
        accountDetailView = DetailView(frame: CGRect.zero)
        
        if let account = curAccount {
            accountDetailView.nameLabel.text = account.account_name
            accountDetailView.descLabel.text = account.desc
            accountDetailView.imageView.image = account.image
            accountDetailView.doneButton.addTarget(self, action: #selector(done(_:)), for: .touchUpInside)
            accountDetailView.doneButton.addTarget(self, action: #selector(press(_:)), for: .touchDown)
            accountDetailView.doneButton.addTarget(self, action: #selector(cancel(_:)), for: .touchUpOutside)
        }
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "DETAILS"
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        self.view.addSubview(accountDetailView)

    }
    
    override func makeConstraints() {
        accountDetailView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    @objc func done(_ sender: UIButton!) {
        accountDetailView.doneButton.layer.shadowOpacity = 0.6
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func press(_ sender: UIButton!) {
        accountDetailView.doneButton.layer.shadowOpacity = 0
    }
    
    @objc func cancel(_ sender: UIButton!) {
        accountDetailView.doneButton.layer.shadowOpacity = 0.6
    }
    
}
