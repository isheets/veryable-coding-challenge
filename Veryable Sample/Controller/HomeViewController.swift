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
    var helloWorldText : UILabel!
    
                                      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
    
    }
    
    override func addSubviews() {
        super.addSubviews()
        
        backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.vryBackground()
        self.view.addSubview(backgroundView)
        
        helloWorldText = UILabel()
        helloWorldText.text = "Hello World!"
        helloWorldText.font = UIFont.vryAvenirNextBold(12)
        self.view.addSubview(helloWorldText)
        
    }
    
    override func makeConstraints() {
        
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        helloWorldText.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(backgroundView)
        }
        
    }
}
