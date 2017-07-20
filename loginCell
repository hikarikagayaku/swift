//
//  loginCell.swift
//  colen5
//
//  Created by VietAnh on 2017/07/20.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

class loginCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoImageView:UIImageView = {
        let image = UIImage(named: "logo")
        let image1 = UIImage(named: "login1")
        let imageView = UIImageView(image: image, highlightedImage: image1)
        return imageView
    }()
    
    let emailTextField: leftPaddedTextField = {
        let tf = leftPaddedTextField()
        tf.placeholder = "Enter your email"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        return tf
    }()
    let passwordTextField: leftPaddedTextField = {
        let tf = leftPaddedTextField()
        tf.placeholder = "Enter your password"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        return tf
    }()
    
    let loginButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.backgroundColor = .orange
        bt.setTitleColor(.white, for: .normal)
        bt.setTitle("Login", for: .normal)
        return bt
    }()
    
    func setupView(){
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        _ = logoImageView.anchor(centerYAnchor, bottom: nil, left: centerXAnchor, right: nil, topConstant: -250, bottomConstant: 0, leftConstant: -logoImageView.frame.width / 2, rightConstant: 0, widthConstant: 160, heightConstant: 160)
        _ = emailTextField.anchor(logoImageView.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 50)
        _ = loginButton.anchor(passwordTextField.bottomAnchor, bottom: nil, left: leftAnchor, right: rightAnchor, topConstant: 10, bottomConstant: 0, leftConstant: 30, rightConstant: 30, widthConstant: 0, heightConstant: 50)
    }
}

class leftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 10, height: bounds.height)
    }


}


