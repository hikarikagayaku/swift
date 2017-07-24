//
//  HomeController.swift
//  colen7
//
//  Created by VietAnh on 2017/07/25.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class homeController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "We're logged in"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(handleSignOut))
        let imageView = UIImageView(image: UIImage(named: "home"))
        view.addSubview(imageView)
        _ = imageView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, topconstant: 64, bottomconstant: 0, leftconstant: 0, rightconstant: 0, widthconstant: 0, heightconstant: 0)
    }
    
    func handleSignOut(){
        UserDefaults.standard.setIsLoggedIn(value: false)
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}
