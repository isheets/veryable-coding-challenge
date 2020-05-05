//
//  HomeViewController.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController {


    var backgroundView : UIView!
    var accountTableView : UITableView!
    
    
    let accountCellId = "accountCellId"
                                      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ACCOUNTS"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
    
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.vryBackground()
        self.view.addSubview(backgroundView)
        
        accountTableView = UITableView()
        accountTableView.delegate = self
        accountTableView.dataSource = self
        accountTableView.register(UITableViewCell.self, forCellReuseIdentifier: accountCellId)
        self.view.addSubview(accountTableView)
        
    }
    
    override func makeConstraints() {
        
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        accountTableView.snp.makeConstraints { (make) in
            make.edges.equalTo(backgroundView)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: accountCellId, for: indexPath)
        cell.textLabel?.text = "Test \(indexPath.row)"
        
        return cell
    }
    
}
