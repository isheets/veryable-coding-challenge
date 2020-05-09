//
//  HomeViewController.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: BaseViewController, DataModelDelegate {
    
    var homeView : HomeView!

    private var tableViewDataSourceDelegateProvider: TableViewDataSourceDelegateProvider?
    private var accountNetwork: AccountNetwork?
    
    override func viewDidLoad() {
        homeView = HomeView(frame: CGRect.zero)
        
        //use delegate pattern to recieve results of server data
        accountNetwork = AccountNetwork(delegate: self)
        fetchData()
        
        super.viewDidLoad()
    }
    
    //try to load the data via the network
    override func fetchData() {
        do {
            try accountNetwork?.fetchAccounts()
        } catch {
            print(error)
            failedDataUpdate()
        }
    }
    
    //something went wrong getting or parsing the data, alert user with options
    func failedDataUpdate() {
        let alert = UIAlertController(title: "Could not load accounts", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { action in
            self.fetchData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            self.homeView.loadingIndicator.stopAnimating()
        }))
        
        self.present(alert, animated: true)
    }
    
    //successful data fetching! set delegate and data source to display results in UITableView
    func didRecieveDataUpdate(data: [Account]) {
        homeView.loadingIndicator.stopAnimating()
        
        tableViewDataSourceDelegateProvider = TableViewDataSourceDelegateProvider(accounts: data, navController: self.navigationController)
        homeView.accountTableView.delegate = tableViewDataSourceDelegateProvider
        homeView.accountTableView.dataSource = tableViewDataSourceDelegateProvider
        homeView.accountTableView.register(AccountCellView.self, forCellReuseIdentifier: Constants.AccountCellId)
        homeView.accountTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "ACCOUNTS"
        
        //clear selection when user returns from details
        if let indexPath = homeView.accountTableView.indexPathForSelectedRow {
            homeView.accountTableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func addSubviews() {
        super.addSubviews()
        self.view.addSubview(homeView)
    }
    
    override func makeConstraints() {
        homeView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        super.makeConstraints()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            
            guard
                let selectedIndexPathCell = homeView.accountTableView.indexPathForSelectedRow,
                let selectedCell = homeView.accountTableView.cellForRow(at: selectedIndexPathCell)
                as? AccountCellView
              else {
                return nil
            }
            
            let selectedCellImage = selectedCell.accountImageView

            transition.imageOriginFrame = selectedCell.background.convert(selectedCellImage.frame, to: nil)
            transition.transitionImage = selectedCellImage.image ?? UIImage()
            
            transition.presenting = true
            return transition
        }
        else {
            transition.presenting = false
            return transition
        }
    }
}
