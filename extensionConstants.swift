//
//  extensionConstants.swift
//  colen7
//
//  Created by VietAnh on 2017/07/23.
//  Copyright © 2017 VietAnh. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchorToTop (top: NSLayoutYAxisAnchor? = nil,bottom: NSLayoutYAxisAnchor? = nil,left: NSLayoutXAxisAnchor? = nil,right: NSLayoutXAxisAnchor? = nil){
        anchorWithConstantsToTop(top: top, bottom: bottom, left: left, right: right, topconstant: 0, bottomconstant: 0, leftconstant: 0, rightconstant: 0)
        
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil,bottom: NSLayoutYAxisAnchor? = nil,left: NSLayoutXAxisAnchor? = nil,right: NSLayoutXAxisAnchor? = nil, topconstant: CGFloat = 0, bottomconstant: CGFloat = 0, leftconstant: CGFloat = 0, rightconstant: CGFloat = 0) {
       _ = anchor(top: top, bottom: bottom, left: left, right: right, topconstant: topconstant, bottomconstant: bottomconstant, leftconstant: leftconstant, rightconstant: rightconstant)
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,bottom: NSLayoutYAxisAnchor? = nil,left: NSLayoutXAxisAnchor? = nil,right: NSLayoutXAxisAnchor? = nil, topconstant: CGFloat = 0, bottomconstant: CGFloat = 0, leftconstant: CGFloat = 0, rightconstant: CGFloat = 0, widthconstant: CGFloat = 0, heightconstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var anchors = [NSLayoutConstraint]()
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topconstant))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomconstant))
        }
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftconstant))
        }
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightconstant))
        }
        if widthconstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthconstant))
        }
        if heightconstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightconstant))
        }
        anchors.forEach({ (nslayout) in
            nslayout.isActive = true
        })
        return anchors
    
    }
}
