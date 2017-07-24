//
//  mainNavigationController.swift
//  colen7
//
//  Created by VietAnh on 2017/07/24.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if isLoggedIn() {
            let home = homeController2()
            viewControllers = [home]
        } else {
            perform(#selector(showloginController), with: nil, afterDelay: 0.1)
        }
        
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    func showloginController () {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}


