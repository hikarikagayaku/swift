//
//  extensionConstant.swift
//  colen5
//
//  Created by VietAnh on 2017/07/20.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

extension UIView {
    func anchorToTop (_ top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil){
    anchorWithConstantsToTop(top, bottom: bottom, left: left, right: right, topConstant: 0, bottomConstant: 0, leftConstant: 0, rightConstant: 0)
    }
    
    
func anchorWithConstantsToTop(_ top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,  topConstant: CGFloat = 0, bottomConstant: CGFloat = 0, leftConstant: CGFloat = 0, rightConstant: CGFloat = 0){
    
    _ = anchor(top, bottom: bottom, left: left, right: right, topConstant: topConstant, bottomConstant: bottomConstant, leftConstant: leftConstant, rightConstant: rightConstant)
}


func anchor(_ top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,  topConstant: CGFloat = 0, bottomConstant: CGFloat = 0, leftConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
    translatesAutoresizingMaskIntoConstraints = false
    var anchors = [NSLayoutConstraint]()
    
    if let top = top {
        anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
    }
    if let bottom = bottom {
        anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
    }
    if let left = left {
        anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
    }
    if let right = right {
        anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
    }
    if widthConstant > 0 {
        anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
    }
    if heightConstant > 0{
        anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
    }
    anchors.forEach({$0.isActive = true})
    
    return anchors
}
}