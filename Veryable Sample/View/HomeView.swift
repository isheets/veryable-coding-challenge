//
//  HomeView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/8/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

class HomeView: UIView {

    var accountTableView : UITableView!
    
    private var setupConstraints = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accountTableView = UITableView()

        
        let header = UIView()
        header.backgroundColor = UIColor.vryBackground()
        header.frame = CGRect(x: 0, y: 0, width: accountTableView.frame.width, height: 16)
        accountTableView.tableHeaderView = header //add space to top
        
        accountTableView.tableFooterView = UIView() //remove empty cells from bottom
        accountTableView.backgroundColor = UIColor.vryBackground()
        accountTableView.separatorStyle = .none
        
        self.addSubview(accountTableView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(setupConstraints) {
            accountTableView.snp.makeConstraints { (make) in
                make.edges.equalTo(self)
            }
        }
        super.updateConstraints()
    }

}
