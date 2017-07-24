//
//  loginPage.swift
//  colen7
//
//  Created by VietAnh on 2017/07/23.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class loginPage: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoView : UIImageView = {
       let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        return imageView
        
    }()
    
    let emailtf:UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.placeholder = " Enter email"
        return tf
    }()
    
    let passwd:UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = " Enter password"
        return tf
    }()
    
    lazy var loginbt: UIButton = {
        let bt = UIButton(type: .system)
        bt.backgroundColor = .orange
        bt.setTitle("Login", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return bt
        
    }()
    

    
    weak var delegate:loginDelegate?
    
    func handleLogin(){
        delegate?.finishLoggingIn()
    }
    
    func setupView(){
        addSubview(logoView)
        addSubview(emailtf)
        addSubview(passwd)
        addSubview(loginbt)
        _ = logoView.anchor(top: centerYAnchor, bottom: nil, left: centerXAnchor, right: nil, topconstant: -250, bottomconstant: 0, leftconstant: -logoView.frame.width / 2, rightconstant: 0, widthconstant:160, heightconstant:160)
        _ = emailtf.anchor(top: logoView.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topconstant: 10, bottomconstant: 0, leftconstant: 30, rightconstant: 30, widthconstant: 0, heightconstant: 50)
        _ = passwd.anchor(top: emailtf.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topconstant: 10, bottomconstant: 0, leftconstant: 30, rightconstant: 30, widthconstant: 0, heightconstant: 50)
        _ = loginbt.anchor(top: passwd.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topconstant: 10, bottomconstant: 0, leftconstant: 30, rightconstant: 30, widthconstant: 0, heightconstant: 50)
    }
}
