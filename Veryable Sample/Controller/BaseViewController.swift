//
//  BaseViewController.swift
//  Veryable Sample
//
//  Created by Pooja Kaluskar on 3/27/20.
//  Copyright © 2020 Veryable Inc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, ViewProtocol, ViewControllerProtocol, UINavigationControllerDelegate {
    
    var appDel = UIApplication.shared.delegate as! AppDelegate
    var transition = PopAnimator.singleton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        self.addSubviews()
        self.makeConstraints()
        self.fetchData()
        self.registerNotifications()
    }
         
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.postLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.postAppearing()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func addSubviews() {
        self.view.backgroundColor = UIColor.vryBackground()
    }
    
    func makeConstraints() {}
    func navigationSetup() {}
    func postLayoutSubviews() {}
    func postAppearing() {}
    func fetchData() {}
    func loadData() {}
    func registerNotifications() {}
    func notificationReceived(_ notification: Notification) {}
}

protocol ViewProtocol {
    func addSubviews()
    func makeConstraints()
}

protocol ViewControllerProtocol : class {
    func navigationSetup()
    func postLayoutSubviews()
    func postAppearing()
    func fetchData()
    func loadData()
    func registerNotifications()
    func notificationReceived(_ notification: Notification)
}
